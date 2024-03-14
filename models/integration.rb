class Integration < ActiveYaml::Base
  include ActiveHash::Associations

  set_root_path "data"
  set_filename "integrations"

  field :brand_color
  field :description
  field :categories, default: []
  field :slug
  field :name
  field :url

  has_many :actions, class_name: "Integration::Action"
  has_many :triggers, class_name: "Integration::Trigger"

  def integratable
    Integration.where.not(id: id)
  end

  def to_param
    slug
  end
end
