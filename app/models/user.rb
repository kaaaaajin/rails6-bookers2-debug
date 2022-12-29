class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローする側のhasmanyなのかフォローされる側のhasmanyなのかを区別するためのreverse_of_
  has_many :followings, through: :relationships, source: :followed
  # あるユーザーがフォローしている人を全員取ってくる　source:フォローされる人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # あるユーザーをフォローしている人を全員取ってくる　source:フォローしてくれている人
  
  # has_many,throughと記述すると中間テーブルを介した向こう側(source)のテーブルからデータを取ってくることができる
  
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }



  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  
  
end
