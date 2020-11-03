class WelcomeController < ApplicationController
  skip_before_action :logged_in?, only: [:index]
  
  def index
    render :new
  end

end
