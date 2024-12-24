class RegisterController < ApplicationController
  before_action :require_login
    def index
      render("register/register")
    end
end