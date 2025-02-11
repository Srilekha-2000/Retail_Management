class RetailorVisit < ApplicationRecord
belongs_to :user
belongs_to :retailor
# belongs_to :role
belongs_to :visit, foreign_key: 'visit_token', optional: true
  before_validation :remove_blank_activities

  private

  def remove_blank_activities
    self.activity.reject!(&:blank?) if activity.is_a?(Array)
  end
end

