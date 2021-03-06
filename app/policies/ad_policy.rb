class AdPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user) #j'affiche toutes les annonces du pilote connécté
      #scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
   user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

private

def user_is_owner_or_admin?
  record.user == user || user.admin
end

end
