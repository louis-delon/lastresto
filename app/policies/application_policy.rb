class ApplicationPolicy

  attr_reader :seller, :record, :buyer

  def initialize(context, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless context
    @seller = context.seller
    @buyer = context.buyer
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(context, record.class)
  end


  class Scope
    attr_reader :context, :scope

    def initialize(context, scope)
      @context = context
      @scope = scope
    end

    def resolve
      scope
    end
  end

end
