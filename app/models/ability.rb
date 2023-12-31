# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    can :create, Car
    can :create, Reservation
    can :update, Reservation, user_id: user.id
    can :destroy, Reservation, user_id: user.id
    can :read, Reservation
  end
end
