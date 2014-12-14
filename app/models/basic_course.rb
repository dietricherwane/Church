class BasicCourse < ActiveRecord::Base
  # Cours de base

  # Accessible fields
  attr_accessible :status, :status_id

  # Relationships
  belongs_to :status

  # Scopes
  default_scope {order("created_at DESC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    status: 'Cours faits'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :status, :status_id, presence: true
end
