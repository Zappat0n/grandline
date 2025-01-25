class Model::Variable < ApplicationRecord
  belongs_to :definition, class_name: "Model::Definition"
end
