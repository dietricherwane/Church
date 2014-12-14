class OfferingType < ActiveRecord::Base
  # Les types d'offrandes

  # Accessible fields
  attr_accessible :name, :published

  # Relationships
  has_many :offerings

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: "Le type d'offrande"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :name, presence: true
  validates :name, length: { in: 2..150 }
end
