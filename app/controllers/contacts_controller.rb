class ContactsController < ApplicationController
  before_action :authenticate_user!

  def create
    contact = User.find(params[:contact_id])
    current_user.contact_users << contact

    redirect_to contacts_path
  end

  def index
    render locals: {
      contacts: current_user.contact_users,
      ai_models: User.ai_models.where.not(id: current_user.ai_models.select(:id))
    }
  end
end
