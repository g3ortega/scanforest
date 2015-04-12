class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all

      elsif user.regular?
        #Global abilities
        can [:read, :create], :all
        #Abilities on User
        can :update, User do |editing_user|
           editing_user == user
        end
        #Abilities on Alert
        can [:update, :destroy], Alert do |alert|
          alert.try(user) == user
        end
        #Abilities on AlertImage
        can [:update, :destroy], AlertImage do |alert_image|
          alert_image.alert.try(user) == user
        end

        #Abilities on AlertRanking
        can [:update, :destroy], AlertRanking do |alert_ranking|
          alert_ranking.user == user
        end

      end
  end
end
