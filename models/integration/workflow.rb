class Integration::Workflow < ActiveYaml::Base
  include ActiveHash::Associations

  set_root_path "data"
  set_filename "workflows"

  field :name
  field :description

  belongs_to :trigger, class_name: "Integration::Trigger"
  has_many :action_items, class_name: "Integration::ActionItem"
end
