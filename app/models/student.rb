class Student < ActiveRecord::Base
  # Elève ou étudiant

  # Accessible fields
  attr_accessible :class_branch, :school, :school_phone_number, :social_status_id

  # Relationships
  belongs_to :social_status

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    class_branch: 'La classe ou la filière',
    school: "Le nom de l'école",
    school_phone_number: "Numéro de téléphone",
    social_status_id: 'Le statut social'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :social_status_id, presence: true
  validates :class_branch, :school, length: {maximum: 150, allow_blank: true}
end
