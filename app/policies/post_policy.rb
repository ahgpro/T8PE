class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
     	scope.all
    end
  end

  def create?
  	true # tout les users peuvent creer un post
  end

  def show?
  	true # tout les users peuvent voir un post
  end 

  def update?
  	user_is_admin? 
  end

  def destroy?
  	user_is_admin?  # tout les users peuvent voir un post
  end 

  private

  def user_is_admin?
  	# Seul le owner du post peut le modifier
  	# record => @post
  	# user => current_user
  	user.admin || record.user == user
  end
end
