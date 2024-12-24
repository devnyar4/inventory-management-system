class ListController < ApplicationController
  before_action :require_login
    def index
      @items = Item.all
      render("list/list")
    end
  end
  