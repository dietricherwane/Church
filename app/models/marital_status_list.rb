class MaritalStatusList < ActiveRecord::Base
  # Liste des statuts matrimoniaux

  # Accessible fields
  attr_accessible :name, :published

  # Relationships
  has_many :marital_statuses

  # Scopes
  default_scope {order("name ASC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: 'Le statut matrimonial'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
end
