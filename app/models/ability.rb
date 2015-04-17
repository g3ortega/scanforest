class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)

      #Global abilities
      can :read, :all

      if user.admin?
        can :manage, :all

      elsif user.regular? || user.technician?
        #Abilities on User
        can :update, User do |editing_user|
           editing_user == user
        end
        #Abilities on Alert
        can :create, Alert
        can [:update, :destroy], Alert do |alert|
          alert.user == user
        end
        #Abilities on AlertImage
        can [:create, :update, :destroy], AlertImage do |alert_image|
          alert_image.alert.user == user
        end

        #Abilities on AlertRanking
        can [:create, :update, :destroy], AlertRanking do |alert_ranking|
          alert_ranking.user == user
        end
      elsif user.guest?
        #Ability to create user
        can [:create, :read], User
      end
  end
end
