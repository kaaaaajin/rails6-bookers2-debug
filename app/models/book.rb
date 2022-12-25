class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy


  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}


 def favorited_by?(user)
    favorites.exists?(user_id: user.id)  
    # existsメソッドで存在の確認
    # 引数にcurrent_userの情報が入る
    # user_id にcurrent_userが存在しているか？
 end

end
