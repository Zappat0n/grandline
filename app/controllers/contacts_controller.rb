class ContactsController < ApplicationController

  def create
    contact = User.find(params[:contact_id])
    current_user.contact_users << contact

    redirect_to contacts_path
  end

  def index
    render locals: {
      contacts: current_user.contact_users,
      ai_models: User.ai.where.not(id: current_user.contacts.select(:contact_id))
    }
  end

  def show
    user = User.find(params[:id])

    render locals: {
      messages: current_user.conversation_with(user)
    }
  end
end
