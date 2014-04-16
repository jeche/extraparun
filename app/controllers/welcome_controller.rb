class WelcomeController < ApplicationController
  def index
  	if !signed_in?
    	redirect_to '/signinpage'
  	end
  end
end
