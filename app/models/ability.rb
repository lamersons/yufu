class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    user.permissions.each do |permission|
      if permission.subject_id.nil?
        if permission.subject_class.to_sym == :all
          can permission.action.to_sym, :all
        else
          can permission.action.to_sym, permission.subject_class.constantize
        end

      else
        can permission.action.to_sym, permission.subject_class.constantize, id: permission.subject_id
      end
    end

    can :manage, :all if user.is_a? Admin
  end
end
