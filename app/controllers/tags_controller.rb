class TagsController < ApplicationController
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
    params.require(:tag).permit(
      :name
    )
  end

  def klass
    Tag
  end
  helper_method :klass
end
