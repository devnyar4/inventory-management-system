class UpdateController < ApplicationController
    before_action :require_login
    def index
      render("update/update")
    end
  end