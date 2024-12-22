class Contacts::FindsController < ApplicationController
  before_action :authenticate_user!

  def show
    contact = User.find_by(username: params[:username])

    render json: {
      html: html_for(contact)
    }.to_json
  end

  private

  def html_for(user)
    if user
      render_to_string(partial: "contacts/add_contact", formats: [:html], locals: { contact: user })
    else
      render_to_string(partial: "contacts/no_contact", formats: [:html])
    end
  end
end
