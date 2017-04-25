# Application-wide helper methods
module ApplicationHelper
  # https://github.com/bootstrap-ruby/rails-bootstrap-forms/blob/master/lib/bootstrap_form/helpers/bootstrap.rb#L14-L31
  def form_errors(object, title = nil, options = {})
    css = options[:class] || 'bs-callout bs-callout-danger'
    return unless object.respond_to?(:errors) &&
                  object.errors.full_messages.any?
    title ||= "#{pluralize(object.errors.full_messages.length, 'Error')} " \
      'prevented this from saving:'
    content_tag :div, class: css do
      concat content_tag :h4, title if title
      concat error_summary(object) unless options[:error_summary] == false
    end
  end
end
