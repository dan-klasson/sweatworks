class Publication < ApplicationRecord
  belongs_to :author
  scope :search, ->(title) { where('title ilike ?', "%#{title}%") }
end
