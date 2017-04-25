# CRUD ops for controllers
module Crud
  extend ActiveSupport::Concern

  included do
    helper_method :current_set
    helper_method :current_object
  end

  def index; end

  def new
    @current_object = klass.new
  end

  def create
    @current_object = klass.new(safe_params)

    if current_object.save
      redirect_to(
        index_path,
        notice: notice('Successfully created!')
      )
    else
      render :new, alert: 'There was an error'
    end
  end

  def show; end

  def edit; end

  def update
    if current_object.update(safe_params)
      format.html do
        redirect_to(
          index_path,
          notice: notice("Successfully updated#{name}!")
        )
      end
    else
      format.html { render :edit, alert: 'There was an error' }
    end
  end

  def destroy
    if current_object.destroy
      redirect_to(
        index_path,
        notice: "Successfully deleted#{current_object.name}!"
      )
    else
      redirect_to :back, alert: current_object.errors.full_messages.join(', ')
    end
  end

  private

  def index_path
    { action: :index }
  end

  def notice(message)
    %(#{message} <a class="btn btn-xs btn-default" href="#{url_for(action: :edit, id: current_object)}"><i class="fa fa-pencil"></i> Edit again</a>)
  end

  def current_set
    @current_set ||= begin
                       query = apply_scopes(klass)
                       query = query.ordered
                       extend_current_set(query.page(params[:page]))
                     end
  end

  def extend_current_set(query)
    # override to chain stuff to the query
    query
  end

  def current_object
    @current_object ||= klass.find(params[:id])
  end
end
