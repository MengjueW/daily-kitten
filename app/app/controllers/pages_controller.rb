class PagesController < ApplicationController
    layout 'homepage', only: [:show, :signin]

    def show
        render template: "pages/signupOption"
    end

    def signin
        render template: "pages/signinOption"
    end

end
