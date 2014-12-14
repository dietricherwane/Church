class Status < ActiveRecord::Base
  # Statut

  # Accessible fields
  attr_accessible :devoted_id, :status_list_id, :published

  # Relationships
  belongs_to :devoted
  belongs_to :status_list
  has_one :basic_course
  has_one :baptism

  # Scopes
  default_scope {order("name ASC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    devoted_id: 'Le fidèle',
    status_list_id: 'Le statut'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :devoted_id, :status_list_id, presence: true
end
