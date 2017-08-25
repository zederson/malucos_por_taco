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
    return if object.nil? || object.errors.empty?
    'has-danger' if object.errors.key? attribute
  end

  def print_errors(object, attribute)
    return if object.nil? || object.errors.empty?
    values = object.errors[attribute]
    content_tag(:div) do
      values.each do |message|
        concat(content_tag(:div, class: 'form-control-feedback') { message })
      end
    end
  end

  def image_profile(nick_name)
    image_name = I18n.transliterate nick_name.downcase
    path = "/images/profile/#{image_name}.jpg"
    image_tag path, alt: nick_name
  end
end
