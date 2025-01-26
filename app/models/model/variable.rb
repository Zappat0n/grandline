class Model::Variable < ApplicationRecord
  belongs_to :definition, class_name: "Model::Definition", foreign_key: "model_definition_id"
end
