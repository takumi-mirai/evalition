class TopicsController < ApplicationController
  def index
    @topics = Topic.order(id: :desc).page(params[:page]).per(2)
  end
  
  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.page(params[:page]).per(30)
    @post =  @topic.posts.build
  end
  
  def new
    @topic = current_user.topics.build
    @topic.posts.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = 'トピックを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'トピックの投稿に失敗しました。'
      render :new
    end
  end
  
  private

  def topic_params
    params.require(:topic).permit(:title, posts_attributes: [:user_id, :content])
  end

end
