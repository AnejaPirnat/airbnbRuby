class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :post
    validates_presence_of :from, :to
    validate :from_must_be_before_to
    
    def from_must_be_before_to
        errors.add(:from, "must be before end date") unless
        from < to
    end

end
