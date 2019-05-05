class Publication < ApplicationRecord
  belongs_to :author
  scope :search, ->(title) { where('title ilike ?', "%#{title}%") }
  scope :author, -> { joins(:author).includes(:author) }
  self.per_page = 10 # pagination
end
