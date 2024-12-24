class ListController < ApplicationController
  before_action :require_login
    def index
      render("list/list")
    end
  end
  