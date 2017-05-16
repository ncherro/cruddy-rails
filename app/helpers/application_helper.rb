# Application-wide helper methods
module ApplicationHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

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

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type)

      tag_class = options.extract!(:class)[:class]
      tag_options = {
        class: "alert fade in alert-#{type} #{tag_class}"
      }.merge(options)

      close_button = content_tag(:button, raw("&times;"), type: "button", class: "close", "data-dismiss" => "alert")

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg.try(:html_safe), tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def page_title
    if content_for?(:title)
      yield(:title)
    else
      path = request.path.split('/').reject { |i| i == 'admin' }
      "Crud#{path.map(&:titleize).join(' | ')}"
    end
  end
end
