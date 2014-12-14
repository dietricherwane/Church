class Baptism < ActiveRecord::Base
  # Baptêmes

  # Accessible fields
  attr_accessible :baptism_date, :place, :ministry, :baptist_responsibility_id, :status_id

  # Relationships
  belongs_to :baptist_responsibility
  belongs_to :status

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    baptism_date: 'La date du baptême',
    place: 'Le lieu du baptême',
    ministry: 'Le nom du ministère',
    baptist_responsibility_id: 'La résponsablité',
    status_id: 'Le statut'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :baptism_date, :place, :ministry, :status_id, presence: true
  validates :place, :ministry, length: {in: 2..150}
end
