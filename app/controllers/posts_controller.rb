class PostsController < ApplicationController
  has_scope :title
  has_scope :category_ids, type: :array
  has_scope :tag_ids, type: :array

  include CruddyController

  class << self
    def filters
      {
        title: {
          type: :string,
          label: 'Title'
        },
        tag_ids: {
          type: :select,
          label: 'Tags',
          collection: Tag.pluck(:name, :id)
        },
        category_ids: {
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
end
