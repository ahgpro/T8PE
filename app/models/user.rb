class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favs, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def admin?
    ["hhuguenin.arnaud@gmail.com"].include? self.email
  end
end
