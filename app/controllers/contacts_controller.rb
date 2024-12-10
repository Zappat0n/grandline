class ContactsController < ApplicationController
  def index
    render locals: {
      contacts: current_user.contact_users
    }
  end

  def show
    user = User.find(params[:id])

    render locals: {
      messages: current_user.conversation_with(user)
    }
  end
end
