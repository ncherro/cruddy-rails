class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true
  validates :name, uniqueness: true

  # has_scope scopes
  scope :by_name, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") }
end
