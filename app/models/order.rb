class Order < ApplicationRecord
  has_one :cart, dependent: :destroy

  enum status: { unpaid: 0, paid: 1 }

  validates :email, presence: true
end
