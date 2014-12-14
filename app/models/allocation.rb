class Allocation < ActiveRecord::Base
  # Affectations

  # Accessible fields
  attr_accessible :firstname, :lastname, :from, :to, :provenance_ministry, :destination_ministry, :role

  # Relationships

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    firstname: 'Le nom',
    lastname: 'Le prénom',
    from: 'La date de début',
    to: 'La date de fin',
    provenance_ministry: "Le ministère d'origine",
    destination_ministry: 'Le ministère de destination',
    role: 'La fonction'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :from, :provenance_ministry, :destination_ministry, :role, presence: true
  validates :firstname, :lastname, :provenance_ministry, :destination_ministry, :role, length: {in: 2..150}
end
