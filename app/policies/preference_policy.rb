class PreferencePolicy < ApplicationPolicy

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

  def show?
    current_buyer_is_owner?
  end

  def update?
    current_buyer_is_owner?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  private

  def current_buyer_is_owner?
    @buyer = @record.buyer
  end

end
