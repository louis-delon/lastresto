class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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

  def show?
    true
  end

  def update?
    current_seller?
  end

  def destroy?
    update?
  end

  private

  def current_seller?
    @record.seller == seller
  end

end
