# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Safari, public: true
    if user.persisted?
      can :create, Reservation
      can :read, Reservation, user_id: user.id
    end

    can :manage, :all if user.role == 'admin'
  end
end
