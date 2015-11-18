class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	if user_signed_in? 
  		devise_parameter_sanitizer.for(:sign_up) do |u|
      		u.permit(:name, :city, :state, :zipcode, :phone_number, :street_number)
      	end
      	devise_parameter_sanitizer.for(:account_update) do |u|
      		u.permit(:name, :city, :state, :zipcode, :phone_number, :street_number)
      	end
   	elsif shelter_signed_in?
   		devise_parameter_sanitizer.for(:sign_up) do |u|
   			u.permit(:name, :city, :state, :zipcode, :phone_number, :street_number)
   		end
    	devise_parameter_sanitizer.for(:account_update) do |u|
   			u.permit(:name, :city, :state, :zipcode, :phone_number, :street_number)
   		end
    end
end
end