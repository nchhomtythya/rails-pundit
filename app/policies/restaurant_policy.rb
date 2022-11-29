class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all # Restaurant.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    # only the owner of restaurant
    # record - the restaurant instance
    # user - the current user (is devise user but in pundit land)
    record.user = user
  end

  def destroy
    record.user = user
  end

end
