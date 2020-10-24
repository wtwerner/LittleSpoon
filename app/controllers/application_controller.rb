class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def welcome
        if user_signed_in?
            render 'users/show'
        else
            render 'welcome'
        end
    end 
end
