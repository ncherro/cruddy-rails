class PostsController < ApplicationController
  helper_method :klass

  has_scope :title
  has_scope :category_ids, type: :array
  has_scope :tag_ids, type: :array

  include Crud

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
          collection: Tag.pluck(:id, :name),
          multiple: true
        },
        category_ids: {
          type: :select,
          label: 'Categories',
          collection: Category.pluck(:id, :name),
          multiple: true
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
end
