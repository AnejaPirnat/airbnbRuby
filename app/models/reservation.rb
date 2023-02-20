class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :start_date, :end_date, presence: true
  validate :start_must_be_before_end_date
end
