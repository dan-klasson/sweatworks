FactoryBot.define do

  sequence :name do |n|
    "Daniel Klasson #{n}"
  end
  sequence :email do |n|
    "dan#{n}@example.com"
  end

  factory :author do
    name
    email
    birth_date { Date.new(1979, 6, 22) }
  end
end