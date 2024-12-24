require "rails_helper"

RSpec.describe ContactsController do
  describe "index" do
    it "authenticates the user" do
      get :index

      expect(response).to redirect_to(new_user_session_path)
    end

    it "returns http success" do
      user = create(:user)
      sign_in(user)

      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "create" do
    it "authenticates the user" do
      post :create

      expect(response).to redirect_to(new_user_session_path)
    end

    it "creates a contact" do
      user = create(:user)
      contact = create(:user)
      sign_in(user)

      post :create, params: { contact_id: contact.id }

      expect(user.contact_users).to include(contact)
      expect(response).to redirect_to(contacts_path)
    end
  end
end
