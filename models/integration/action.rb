class Integration::Action < ActiveYaml::Base
  include ActiveHash::Associations

  set_root_path "data"
  set_filename "actions"

  field :name
  field :description

  belongs_to :integration, class_name: "Integration"
end
