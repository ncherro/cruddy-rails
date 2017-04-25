module Controllers
  # Crud concerns
  module Crud
    extend ActiveSupport::Concern

    def index
      klass.ordered.page(params[:page])
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def current_object
      @current_object ||= klass.find(params[:id])
    end
    helper_method :current_object
  end
end
