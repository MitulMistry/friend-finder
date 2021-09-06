class PagesController < ApplicationController
  def index
    @users = User.randomized(3)
  end
end
