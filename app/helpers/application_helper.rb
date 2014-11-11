module ApplicationHelper
  def ts(key)
    ActionController::Base.helpers.content_tag(:span, {id: "#{key}", 'data-mercury' => 'simple'}) do
      t key
    end
  end
end
