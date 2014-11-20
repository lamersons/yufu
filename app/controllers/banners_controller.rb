class BannersController < ApplicationController
  layout false
  def show
    @banner = Banner.find params[:id]
  end
end
