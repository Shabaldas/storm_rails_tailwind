class CallQuestion < ApplicationRecord
  validates :phone_number, presence: true,
                           numericality: true,
                           length: { minimum: 10, maximum: 15 }
end
