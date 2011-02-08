class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :customer
       can :read, [User]
    end
     
  end
end
