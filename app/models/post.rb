class Post < ActiveRecord::Base
  has_many :uploads, dependent: :destroy
  belongs_to :user

  has_many :favs, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # CATEGORIES = ["INTERVIEW","ARTICLE", "T8PE", "VIDEO"]
  # SOUS_CATEGORIES = ["CLASH", "RAP", "LOFI", "BEATS", "TRAP", "ARTISTE", "HOW TO MAKE IT", "HOW IT'S DONE", "TUTO"]

  # validates :user_id, presence: true
end
