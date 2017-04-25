class Post < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :tags

  validates :category, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true

  alias_attribute :name, :title

  # has_scope scopes
  scope :title, (lambda do |title|
    where('LOWER(title) LIKE ?', "%#{title.downcase}%")
  end)
end
