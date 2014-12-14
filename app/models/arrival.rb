class Arrival < ActiveRecord::Base
  # Arrivées

  # Accessible fields
  attr_accessible :firstname, :lastname, :from, :recommandation_letter_id, :origin_church

  # Relationships

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    firstname: 'Le nom',
    lastname: 'Le prénom',
    from: "La date de d'arrivée",
    recommandation_letter_id: "L'identifiant de la lettre de recommandation",
    origin_church: "L'église d'origine"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :from, presence: true
  validates :firstname, :lastname, :origin_church, length: {in: 2..150}
  validates :recommandation_letter_id, length: {maximum: 20}
end
