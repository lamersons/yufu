module Mercury
  module Authentication
    def can_edit?
      authenticate_user!
      can? :manage, I18n
    end
  end
end
