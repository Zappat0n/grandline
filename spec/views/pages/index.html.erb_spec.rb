require 'rails_helper'

RSpec.describe "pages/index.html.erb", type: :view do
  it "renders the different sections" do
    render

    expect(rendered).to have_content(t("pages.index.created_by.body"))
    expect(rendered).to have_content(t("pages.index.created_by.headline"))
    expect(rendered).to have_content(t("pages.index.what_is_this.body"))
    expect(rendered).to have_content(t("pages.index.what_is_this.headline"))
  end
end
