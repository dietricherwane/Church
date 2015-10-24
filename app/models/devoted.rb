class Devoted < ActiveRecord::Base
  # Fidèles



  # Accessible fields
  attr_accessible :firstname, :lastname, :phone_number, :mobile_number, :birthdate, :birthplace, :address, :tribe_id, :identity_card_number, :status_id, :marital_status_id, :social_status_id

  # Relationships
  belongs_to :tribe
  has_one :status
  has_one :marital_status
  has_one :social_status
  #has_one :baptism, through: :status
  #has_one :basic_course, through: :status
  #has_one :married, through: :marital_status
  #has_one :employee, through: :social_status
  #has_one :student, through: :social_status

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    firstname: 'Le nom',
    lastname: 'Les prénoms',
    phone_number: 'Le numéro de téléphone fixe',
    mobile_number: 'Le numéro de téléphone mobile',
    birthdate: 'La date de naissance',
    birthplace: 'Le lieu de naissance',
    address: "L'adresse",
    tribe_id: "L'ethnie",
    identity_card_number: "Le numéro de carte d'identité",
    status_id: 'Le statut',
    social_status_id: 'Le statut social',
    marital_status_id: 'Le statut matrimonial'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :identity_card_number, presence: true
  validates :firstname, :lastname, length: {in: 2..150}
  validates :identity_card_number, length: {maximum: 20}
  validates :identity_card_number, uniqueness: true

  # Custom functions
  def full_name
    return "#{lastname} #{firstname}"
  end
end
