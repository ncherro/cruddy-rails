class PostsController < ApplicationController
  has_scope :by_title
  has_scope :by_tag_id
  has_scope :by_category_id

  include CruddyControllerMixin

  class << self
    def filters
      {
        by_title: {
          type: :string,
          label: 'Title'
        },
        by_tag_id: {
          type: :select,
          label: 'Tags',
          collection: Tag.pluck(:name, :id)
        },
        by_category_id: {
          type: :select,
          label: 'Categories',
          collection: Category.pluck(:name, :id)
        }
      }
    end
  end

  private

  def safe_params
    params.require(:post).permit(
      :title,
      :text,
      :category_id,
      tag_ids: []
    )
  end

  def klass
    Post
  end
  helper_method :klass

  def extend_current_set(query)
    query.includes(:category, :tags)
  end
end
