module Api
  module V1
    class ProfilesController < ApplicationController
      respond_to :json
      before_action :authenticate_user!, only: [:create, :update, :create]
      before_action :change_type, only: [:update]

      def show
        @profile = Profile::Base.find params[:id]
        respond_with @profile, root: 'profile'
      end

      def index
        @profiles = current_user.profiles
        respond_with @profiles
      end

      def create
        profiles = current_user.profiles.map{|profile| profile._type}
        profiles << 'Profile::Base'
        profiles << 'Profile::Translator::Base'
        if params[:profile][:_type].in? profiles
          render json: {success: false}
        else
          @profile = params[:profile][:_type].constantize.new
          current_user.profiles << @profile
          if @profile.update_attributes profile_params
            current_user.save
            respond_with @profile, statue: :created, location: false, root: 'profile'
          else
            render json: {success: false}
          end
        end
      end

      def update
        if @profile.update_attributes(profile_params)
          respond_with @profile, statue: :created, location: false, root: 'profile'
        else
          render json: {success: false}
        end
      end

      private
      def profile_params
        case params[:profile][:_type]
        when 'Profile::Client'
          params.require(:profile).permit :company_name, :company_uid, :country
        when 'Profile::Translator::Company'
          params.require(:profile).permit :email, :additional_email, :qq, :skype,  :name, :company_uid, :years_in_business,
                                          :location, :service_phone, :phone, :contacts_person, :address, :is_active,
                                          employees_attributes: [:sex, :age, :direction_id]
        when 'Profile::Translator::Individual'
          params.require(:profile).permit :first_name, :last_name, :passport_till, :passport_num, :passport_country,
                                          :additional_email, :additional_phone, :phone, :qq, :skype, :wechat, :email, :additions, :sex, :visa,
                                          :vise_till, :needs_job_resident_permit, :can_travel, :status, :is_active,
                                          :has_driving_license, :has_car, :native_language_id, {nearby_city_ids:[]},
                                          {nearby_cities_with_surcharge_ids: []}, :city_id,  {direction_ids: []},
                                          :years_in_china, :pay_way, :birthday, :visa_till, :passport_till,
                                          services: [:level, :has_hsk, :verbal_price, :written_price,
                                                                :written_translate_type, :language_id]
        end

      end
      private
      def change_type
        @profile = current_user.profiles.find(params[:id])
        unless params[:profile][:_type] == @profile._type || @profile._type != 'Profile::Translator::Base'
          @profile.update_attribute :_type, params[:profile][:_type]
          @profile = Profile::Base.find @profile.id
        end
      end

    end
  end
end
