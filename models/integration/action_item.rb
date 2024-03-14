class Integration::ActionItem < ActiveYaml::Base
  include ActiveHash::Associations

  set_root_path "data"
  set_filename "action_items"

  field :order

  belongs_to :workflow, class_name: "Integration::Workflow"
  belongs_to :action, class_name: "Integration::Action"
end
