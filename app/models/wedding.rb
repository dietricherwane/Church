class Wedding < ActiveRecord::Base
  # Mariage

  # Accessible fields
  attr_accessible :husband_firstname, :husband_lastname, :wife_firstname, :wife_lastname, :wedding_date, :church

  # Relationships

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    husband_firstname: 'Le nom du mari',
    husband_lastname: 'Le prénom du mari',
    wife_firstname: 'Le nom de la femme',
    wife_lastname: 'Le prénom de la femme',
    wedding_date: 'La date du mariage',
    church: "L'église de célébration"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :husband_firstname, :husband_lastname, :wife_firstname, :wife_lastname, :wedding_date, :church, presence: true
  validates :husband_firstname, :husband_lastname, :wife_firstname, :wife_lastname, :wedding_date, :church, length: {maximum: 150}
end
