class SocialStatus < ActiveRecord::Base
  # Statut social

  # Accessible fields
  attr_accessible :devoted_id, :social_status_list_id, :published

  # Relationships
  belongs_to :social_status
  belongs_to :devoted
  has_one :employee
  has_one :student

  # Scopes

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    devoted_id: 'Le fidèle',
    social_status_list_id: 'Le statut social'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :devoted_id, :social_status_list_id, presence: true
end
