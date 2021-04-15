class OmniauthCallbacksController < ApplicationController
    skip_before_action :verify_authenticity_token
    def facebook
        #idk how to log user in and redirect to welcome#home
    end
end