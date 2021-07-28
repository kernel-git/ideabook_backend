class CompanyPolicy
  attr_reader :user, :comapny

  def initialize(user, company)
    @user = user
    @comapny = comapny
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
      else
        scope.where(id: user.company.id)
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
