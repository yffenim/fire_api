class Alert < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  validates :level, numericality: { in: 1..9 }
  validates_presence_of :level, :user_id
  # before_save :generate_timestamp

  # def generate_timestamp
  #   self.timestemp_field = DateTime.now
  # end

end
