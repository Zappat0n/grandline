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
      post :create, as: :turbo_stream

      expect(response).to redirect_to(new_user_session_path)
    end

    it "creates a message" do
      user = create(:user)
      receiver = create(:user, username: "Michael")
      sign_in(user)

      post :create, as: :turbo_stream, params: { content: "Hello", receiver_id: receiver.id }

      expect(user.messages.size).to be(1)
    end
  end

  describe "show" do
    it "authenticates the user" do
      get :show, params: { id: 1 }

      expect(response).to redirect_to(new_user_session_path)
    end

    it "returns http success" do
      user = create(:user)
      receiver = create(:user, username: "Michael")
      sign_in(user)

      get :show, params: { id: receiver.id }

      expect(response).to have_http_status(:success)
    end
  end
end
