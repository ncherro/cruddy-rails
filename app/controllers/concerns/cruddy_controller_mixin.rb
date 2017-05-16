# DRY up CRUD ops for controllers
module CruddyControllerMixin
  extend ActiveSupport::Concern

  # expose current_set and current_object as helper methods
  included do
    helper_method :current_set
    helper_method :current_object
  end

  def index; end

  def show; end

  def edit; end

  def confirm_delete; end

  def new
    @current_object = klass.new
  end

  def create
    @current_object = klass.new(safe_params)

    if current_object.save
      redirect_to(
        index_path,
        notice: notice("Successfully created #{current_object.name}!")
      )
    else
      render :new, alert: 'There was an error'
    end
  end

  def update
    if current_object.update(safe_params)
      redirect_to(
        index_path,
        notice: notice("Successfully updated #{current_object.name}!")
      )
    else
      render :edit, alert: 'There was an error'
    end
  end

  def destroy
    if current_object.destroy
      redirect_to(
        index_path,
        notice: "Successfully deleted #{current_object.name}!"
      )
    else
      redirect_back fallback_location: root_path,
                    alert: current_object.errors.full_messages.join(', ')
    end
  end

  private

  # default redirect_to path after save / destroy
  def index_path
    { action: :index }
  end

  # notice on successful save
  def notice(message)
    %(#{message} <a class="btn btn-xs btn-default" ) +
      %(href="#{url_for(action: :edit, id: current_object)}">) +
      %(<i class="fa fa-pencil"></i> Edit again</a>)
  end

  # return memoized @current_set - a paginated, scoped set of records
  def current_set
    return @current_set if defined? @current_set
    query = apply_scopes(klass)
    query = query.ordered
    @current_set = extend_current_set(query.page(params[:page]))
  end

  # allow controller to override the current_set query
  def extend_current_set(query)
    query
  end

  # return memoized @current_object
  def current_object
    @current_object ||= klass.find(params[:id])
  end
end
