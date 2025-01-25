class Model::DataPoint < ApplicationRecord
  belongs_to :definition, class_name: "Model::Definition"
end
