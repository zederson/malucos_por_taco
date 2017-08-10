module ApplicationHelper

  def flash_keys(key)
    values = {
      success: 'alert-success',
      error:   'alert-danger',
      notice:  'alert-info',
      alert:   'alert-warning'
    }
    values[key.to_sym]
  end

  def errors_for(object, attribute)
    return if object && object.errors.empty?
    'has-danger' if object.errors.has_key? attribute
  end

  def print_errors(object, attribute)
    values = object.errors[attribute]
    content_tag(:div) do
      values.each do |message|
        concat(content_tag(:div, class: 'form-control-feedback') { message })
      end
    end
  end
end
