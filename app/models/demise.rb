class Demise < ActiveRecord::Base
  # Décès

  # Accessible fields
  attr_accessible :firstname, :lastname, :description, :from, :number_of_children, :wife_husband_firstname, :wife_husband_lastname

  # Relationships

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    firstname: 'Le nom',
    lastname: 'Le prénom',
    description: 'La description',
    from: 'La date du décès',
    number_of_children: "Le nombre d'enfants",
    wife_husband_firstname: "Le nom de l'époux(se)",
    wife_husband_lastname: "Le prénom de l'époux(se)"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :description, :from,, presence: true
end
