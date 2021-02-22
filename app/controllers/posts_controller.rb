class PostsController < ApplicationController
  def create
    @topic = Topic.find(params[:id])
    @post =  @topic.posts.build(post_params)
    if @post.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to topic_url
    else
      flash[:danger] = 'コメントの投稿に失敗しました。'
      redirect_to topic_url
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
