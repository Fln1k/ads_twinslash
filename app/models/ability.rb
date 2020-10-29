class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new :role => 'visitor'
    if user.role == 'admin'
      can :manage, :all
      cannot [:create,:update,:update_state], Ad
      cannot [:read,:destroy], Ad, :state_name => :draft
      cannot :create, User
      can :update_state, Ad, :state_name => :new
    end

    if user.role == 'user'
      can :read, user
      can [:update,:update_state], Ad, :user_id => user.id, :state_name => :draft
      can :update_state, Ad, :user_id => user.id, :state_name => [:denied, :archived]
      can [:read,:destroy], Ad, :user_id => user.id
      can :update, User, :id => user.id
      can [:create,:myads], Ad
    end

    can :read, Ad, :state_name => [:published]
    can :read, AdsType
  end
end