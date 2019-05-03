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

  sequence :title do |n|
    "Title #{n}"
  end
  sequence :body do |n|
    "Body #{n}"
  end
  sequence :published_at do |n|
    DateTime.new(2019, 1, n, 20, 0)
  end

  factory :publication do
    association :author
    title
    body
    published_at
  end
end
