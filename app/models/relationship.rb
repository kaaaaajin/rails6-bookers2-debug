class Relationship < ApplicationRecord
   belongs_to :following, class_name: "User"
   belongs_to :follower, class_name: "User"
   #usersテーブルを参照させるために class_name: "User" を記述する

end
