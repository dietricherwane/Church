class MaritalStatus < ActiveRecord::Base
  # Statut matrimonial

  # Accessible fields
  attr_accessible :marital_status_list_id, :devoted_id

  # Relationships
  belongs_to :devoted
  has_one :married
  belongs_to :marital_status_list

  # Scopes
  default_scope {order("name ASC")}

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    marital_status_list_id: 'Le statut matrimonial',
    devoted_id: 'Le fidèle'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :marital_status_list_id, :devoted_id, presence: true
end
