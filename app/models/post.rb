class Post < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :tags

  validates :category, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true

  alias_attribute :name, :title

  # has_scope scopes
  scope :by_title, (lambda do |title|
    where('LOWER(title) LIKE ?', "%#{title.downcase}%")
  end)
  scope :by_tag_id, (->(id) { joins(:tags).where(tags: { id: id }) })
  scope :by_category_id, (->(id) { where(category_id: id) })
end
