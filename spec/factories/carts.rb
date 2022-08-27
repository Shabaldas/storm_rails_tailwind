FactoryBot.define do
  factory :cart do
    association :order
  end
end
