# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all
    # if user
    #   can :manage, :all
    # else
    #   can :read, :all
    # end
  end

  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
