class PreferencesPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
  end

  def create?

  end

  def show?
  end

  def update?
  end

  def edit?
  end

  def destroy?
  end

  private


end
