module Mercury
  module Authentication
    def can_edit?
      authenticate_user!
      can? :manage, :i18n
    end
  end
end
