class BaptistResponsibility < ActiveRecord::Base
  # Responsabilité du baptisé

  # Accessible fields
  attr_accessible :name, :published

  # Relationships
  has_many :baptisms

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
  validates :name, length: {in: 2..150}
  validates :name, uniqueness: true
end
