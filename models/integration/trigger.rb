class Integration::Trigger < ActiveYaml::Base
  include ActiveHash::Associations

  set_root_path "data"
  set_filename "triggers"

  field :name
  field :description

  belongs_to :integration, class_name: "Integration"
  has_many :workflows, class_name: "Integration::Workflow"
end
