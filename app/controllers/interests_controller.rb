class InterestsController < ApplicationController
  def index
    @interests = Interest.ordered_alphabetized
  end

  def show
    @interest = Interest.find(params[:id])
    @users = @interest.users
  end
end
