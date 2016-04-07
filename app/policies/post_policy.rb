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
  	user_is_owner? 
  end

  def destroy?
  	user_is_owner?  # tout les users peuvent voir un post
  end 

  private

  def user_is_owner?
  	# Seul le owner du post peut le modifier
  	# record => @post
  	# user => current_user
  	record.user == user
  end
end
