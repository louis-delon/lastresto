class Myadmins::ReservationPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
