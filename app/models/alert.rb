class Alert < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  validates :level, numericality: { in: 1..9 }
  validates_presence_of :level, :user_id

end
