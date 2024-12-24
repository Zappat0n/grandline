require "rails_helper"

RSpec.describe MessagesController do
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

    xit "creates a message" do
      user = create(:user)
      receiver = create(:user, username: "Michael")
      sign_in(user)

      post :create, params: { message: { content: "Hello", receiver_id: receiver.id } }

      expect(user.messages).to include(message)
      expect(response).to redirect_to(messages_path)
    end
  end
end
