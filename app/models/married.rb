class Married < ActiveRecord::Base
  # Liste des statuts matrimoniaux

  # Accessible fields
  attr_accessible :marital_status_id, :spouse_firstname, :spouse_lastname, :spouse_birthdate, :spouse_birth_registry_number, :number_of_children, :tribe_id, :wedding_ministry, :wedding_church

  # Relationships
  belongs_to :marital_status

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    marital_status_id: 'Le statut matrimonial',
    spouse_firstname: "Le nom du partenaire",
    spouse_lastname: "Les prénoms du partenaire",
    spouse_birthdate: "La date de naissance",
    spouse_birth_registry_number: "Numéro d'extrait de naissance",
    number_of_children: "Le nombre d'enfants",
    tribe_id: "L'ethnie",
    wedding_ministry: 'Le ministère de célébration',
    wedding_church: "L'église de célébration"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :marital_status_id, :spouse_firstname, :spouse_lastname, presence: true
  validates :number_of_children, numericality: { only_integer: true }
end
