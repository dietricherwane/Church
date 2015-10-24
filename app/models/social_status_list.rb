class SocialStatusList < ActiveRecord::Base
  # Liste des statuts sociaux

  # Accessible fields
  attr_accessible :name

  # Relationships
  has_many :social_statuses

  # Scopes
  default_scope {order("name ASC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: 'Le nom'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true

  # Custom functions
  def self.student_id
    return (find_by_name("Elève").id rescue nil)
  end

  def self.employee_id
    return (find_by_name("Employé").id rescue nil)
  end
end
