# frozen_string_literal: true

require "rails_helper"

RSpec.describe Model::Definitions::Create do
  it "creates a model definition" do
    data = "id,title,approved_at,location,postcode,latitude,longitude,category_id,cost,seo_value,matching_mode,quote_amount,unit
            19,Fensterreinigung,2009-08-24,Egg bei Zürich,8132,47.3016,8.68492,8,,8.10,employer_choice,40.00,flat_rate"
    9
    user = create(:user)
    described_class.new(
      data: data,
      date_column: "approved_at",
      description: "description",
      name: "name",
      user_id: user.id,
      y_variable: "quote_amount",
    ).call

    definition = Model::Definition.last
    expect(definition).to be_a(Model::Definition)
    expect(definition.user).to eq(user)
    expect(definition.name).to eq("name")
    expect(definition.description).to eq("description")

    variables = definition.variables
    expect(variables.count).to eq(11)
    expect(variables.pluck(:name)).to match_array(%w[id title location postcode latitude longitude cost category_id seo_value matching_mode unit])

    data_points = definition.data_points
    expect(data_points.count).to eq(1)
    data_point = data_points.first
    expect(data_point.y).to eq(40.0)
    expect(data_point.created_at).to eq(Time.zone.parse("2009-08-24"))
    expect(data_point.x).to eq(
      "id" => "19",
      "title" => "Fensterreinigung",
      "location" => "Egg bei Zürich",
      "postcode" => "8132",
      "latitude" => "47.3016",
      "longitude" => "8.68492",
      "category_id" => "8",
      "cost" => "",
      "seo_value" => "8.10",
      "matching_mode" => "employer_choice",
      "unit" => "flat_rate",
    )
  end
end
