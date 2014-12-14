class Employee < ActiveRecord::Base
  # Employés

  # Accessible fields
  attr_accessible :company_name, :company_phone_number, :job, :social_status_id

  # Relationships
  belongs_to :social_status

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    company_name: "Le nom de l'entreprise",
    company_phone_number: "Le numéro de téléphone de l'entreprise",
    job: 'Le poste',
    social_status_id: 'Le statut social'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :company_name, :job, :social_status_id, presence: true
  validates :company_phone_number, length: {maximum: 16, allow_blank: true}
end
