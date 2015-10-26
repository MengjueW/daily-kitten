class Shelters::RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
        params.require(:shelter).permit(:name, :title, :city, :url)
    end

    def account_update_params
        params.require(:shelter).permit(:name, :title, :city, :url)
    end
end
