class Alert < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  validates :level, numericality: { in: 1.0..5.0 }
  validates_presence_of :level, :user_id
  before_save :convert_to_1_to_5

end
