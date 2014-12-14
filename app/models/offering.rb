class Offering < ActiveRecord::Base
  # Offrandes

  # Accessible fields
  attr_accessible :firstname, :lastname, :amount, :offering_date, :offering_type_id

  # Relationships
  belongs_to :offering_type

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    firstname: 'Le nom',
    lastname: 'Le prénom',
    amount: 'Le montant',
    offering_date: 'La date du don',
    offering_type_id: "Le type d'offrande"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :amount, :offering_date, :offering_type_id, presence: true
  validates :amount, numericality: { only_integer: true }
end
