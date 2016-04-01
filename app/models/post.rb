class Post < ActiveRecord::Base
  has_many :uploads, dependent: :destroy
  belongs_to :user

  has_many :favs, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
