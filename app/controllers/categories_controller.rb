class CategoriesController < ApplicationController
  has_scope :by_name

  include CruddyControllerMixin

  class << self
    def filters
      {
        by_name: {
          type: :string,
          label: 'Name'
        }
      }
    end
  end

  private

  def safe_params
    params.require(:category).permit(
      :name
    )
  end

  def klass
    Category
  end
  helper_method :klass
end
