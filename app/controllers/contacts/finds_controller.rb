class Contacts::FindController < ApplicationController
  def show
    contact = User.find_by(username: params[:username])
    byebu
  end
end
