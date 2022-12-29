class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  # ログインしていない人は使えない、!はnotという意味
  
  def create
    following = current_user.relationships.build(followed_id: params[:user_id])
    following.save
    redirect_to request.referrer
    # following_id（フォローする人）とfollowed_id（フォローされる人）を保存する
    # フォローする人はログインしている人（current＿user)
    # current_user.relationshipsでUser.rbで記述したforgin_key：following_idにログインしているユーザーのidが入る
    
  end
　
　def destroy
　  following = current_user.relationships.fing_by(followed_id: params[:user_id])
　  following.destroy
　  redirect_to request.referrer
　end
　
　def followings
　  user = User.find(params[:user_id])
　  @users = user.followings
　end
  
  def followers
   user = User.find(params[:user_id])
   @users = user.followers
  end
  
end
