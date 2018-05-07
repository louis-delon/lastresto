class BuyerPolicy < ApplicationPolicy

  # to be manage when an admin will be created

  # class Scope < Scope
  #   def resolve
  #     scope
  #   end
  # end

  def show?
    owner_is_buyer?
  end

  def edit?
    update?
  end

  def update?
    owner_is_buyer?
  end

  private

  def owner_is_buyer?
    @record == buyer
  end

end
