class Tribe < ActiveRecord::Base
  # Ethnie

  # Accessible fields
  attr_accessible :name

  # Relationships
  has_many :devoteds
  has_many :marrieds

  # Scopes
  default_scope {order("name ASC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: 'Le nom'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :name, presence: true
  validates :name, length: {maximum: 150}
  validates :name, uniqueness: true
end
