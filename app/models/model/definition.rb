class Model::Definition < ApplicationRecord
  belongs_to :user
  has_many :data_points, class_name: "Model::DataPoint", dependent: :destroy, foreign_key: "model_definition_id"
  has_many :variables, class_name: "Model::Variable", dependent: :destroy, foreign_key: "model_definition_id"

  accepts_nested_attributes_for :variables, allow_destroy: true
end
