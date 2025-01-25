class Model::Definition < ApplicationRecord
  belongs_to :user
  has_many :data_points, class_name: "Model::DataPoint"
  has_many :variables, class_name: "Model::Variable"

  accepts_nested_attributes_for :variables, allow_destroy: true
end
