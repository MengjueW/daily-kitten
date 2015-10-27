class PagesController < ApplicationController
    layout 'homepage', only: [:show]

    def show
        render template: "pages/signupOption"
    end

end
