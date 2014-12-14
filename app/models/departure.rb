class Departure < ActiveRecord::Base
  # Départs

  # Accessible fields
  attr_accessible :firstname, :lastname, :from, :to, :reason, :recommandation_letter_id, :destination_church

  # Relationships

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    firstname: 'Le nom',
    lastname: 'Le prénom',
    from: 'La date du départ',
    to: 'La date de retour',
    reason: 'Le motif',
    recommandation_letter_id: "La reférence de la lettre de recommandation",
    destination_church: "L'église de destination"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :reason, presence: true
  validates :firstname, :lastname, :destination_church, length: {in: 2..150}
  validates :recommandation_letter_id, length: {maximum: 20}
end
