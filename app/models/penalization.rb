class Penalization < ActiveRecord::Base
  # Pénalités

  # Accessible fields
  attr_accessible :firstname, :lastname, :description, :reason, :from, :to

  # Relationships

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    firstname: 'Le nom',
    lastname: 'Le prénom',
    description: 'Le descriptif de la pénalité',
    reason: 'Le motif',
    from: 'La date de début',
    to: 'La date de fin'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :description, :reason, :from, presence: true
  validates :firstname, :lastname, length: { in: 2..150 }
end
