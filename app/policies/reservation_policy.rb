class ReservationPolicy < ApplicationPolicy
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

  def update?
    current_buyer_is_owner?
  end

  def destroy?
    true
  end

  private

  def current_buyer_is_owner?
    @buyer == @record.buyer
  end

end
