class TopicsController < ApplicationController
  def index
    @topics = Topic.order(id: :desc).page(params[:page]).per(2)
  end
  
  def show
  end
  
  def new
    @topic = current_user.topics.build
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
    params.require(:topic).permit(:title)
  end
end
