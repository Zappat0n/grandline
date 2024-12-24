require 'rails_helper'

RSpec.describe "contacts/index.html.erb", type: :view do
  it "renders the different sections" do
    user = create(:user)
    sign_in user
    render(
      locals: {
        contacts: user.contacts,
        ai_models: user.ai_models
      }
    )

    expect(rendered).to have_content(t("contacts.index.headline"))
  end
end
