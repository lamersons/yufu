module Api
  module V1
    class ProfilesController < ApplicationController
      respond_to :json
      before_action :authenticate_user!, only: [:create, :update]

      def show
        @profile = Profile::Base.find params[:id]
        respond_with @profile, root: 'profile'
      end

      def index
        @profiles = Profile::Base.all
        respond_with @profiles
      end

      def create
        profiles = current_user.profiles.map{|profile| profile._type}
        profiles << 'Profile::Base'
        profiles << 'Profile::Translator::Base'
        if params[:profile][:type].in? profiles
          render json: {success: false}
        else
          @profile = params[:profile][:type].constantize.new
          current_user.profiles << @profile
          if @profile.update_attributes profile_params
            current_user.save
            render json: {success: true}
          else
            render json: {success: false}
          end
        end
      end

      def update
        @profile = current_user.profiles.find(params[:id])
        if @profile.update_attributes(profile_params)
          render json: {success: true}
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
          params.require(:profile).permit :additional_email, :qq, :skype,  :name, :company_uid, :years_in_business,
                                          :location, :service_phone, employees_attributes: [:sex, :age, :direction_id]
        when 'Profile::Translator::Individual'
          params.require(:profile).permit :first_name, :last_name, :passport_till, :passport_num, :passport_country,
                                          :additional_email, :qq, :skype, :additions, :sex, :visa,
                                          :needs_job_resident_permit, :can_travel,
                                          :has_driving_license, :has_car, :native_language_id, :nearby_city_ids,
                                          :nearby_city_with_surcharge_ids, :city,  :directions_ids,
                                          services_attributes: [:level, :has_hsk, :verbal_price, :written_price,
                                                                :written_translate_type, :language_id]
        end

      end

    end
  end
end
