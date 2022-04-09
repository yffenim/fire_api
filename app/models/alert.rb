class Alert < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  validates :level, numericality: { only_integer: true }
  validates_presence_of :level, :user_id

end
