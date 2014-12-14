class Birth < ActiveRecord::Base
  # Naissances

  # Accessible fields
  attr_accessible :firstname, :lastname, :father_firstname, :father_lastname, :mother_firstname, :mother_lastname, :birthdate, :birthdate_registry_id

  # Relationships

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    firstname: 'Le nom',
    lastname: 'Le prénom',
    father_firstname: 'Le nom du père',
    father_lastname: 'Le prénom du père',
    mother_firstname: 'Le nom de la mère',
    mother_lastname: 'Le prénom de la mère',
    birthdate: 'La date de naissance',
    birthdate_registry_id: "Le numéro de l'extrait de naissance"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :father_firstname, :father_lastname, :mother_firstname, :mother_lastname, presence: true
  validates :birthdate_registry_id, length: {maximum: 50}
end
