class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?

  end

  def create?

  end

  def edit?

  end

  def update?

  end

  def destroy?

  end

end
