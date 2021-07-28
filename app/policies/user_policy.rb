class UserPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.superadmin?
        scope.all
      elsif user.admin?
        scope.where.not(role: 'superadmin').where(company: user.company)
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    true
  end
end
