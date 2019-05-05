class Publication < ApplicationRecord
  belongs_to :author
  scope :search, ->(title) { where('title ilike ?', "%#{title}%") }
  self.per_page = 10 # pagination
end
