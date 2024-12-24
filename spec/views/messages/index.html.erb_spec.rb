require 'rails_helper'

RSpec.describe "messages/index.html.erb", type: :view do
  it "renders the different sections" do
    user = create(:user)
    service = Messages::Index.new(user: user)
    sign_in user
    render(
      locals: {
        messages: service.messages
      }
    )

    expect(rendered).to have_content(t("messages.index.headline"))
  end
end
