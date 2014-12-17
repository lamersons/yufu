module ApplicationHelper
  def ts(key, options = {})
    ActionController::Base.helpers.content_tag(:span, {id: "#{key}", 'data-mercury' => 'simple'}) do
      (t key, options).html_safe
    end
  end
end
