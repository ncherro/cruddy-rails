class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # CRUD adds default ordered scope
  scope :ordered, -> { order(updated_at: :desc) }
end
