module Mercury
  module Authentication
    def can_edit?
      authenticate_user! unless admin_signed_in?
      can? :manage, I18n
    end
  end
end
