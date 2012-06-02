class PostsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])

    redirect_to @topic, error: "Please login" unless user_signed_in?

    @post = @topic.posts.new({user: current_user, created_at: Time.now}.merge(params[:post]))

    if @post.save
      redirect_to topic_path(@topic,page: @topic.posts.count/10+1), notice: "Dodano post pomyslnie"
    else
      redirect_to topic_path(@topic,page: @topic.posts.count/10+1), error: "Dodawanie nie powiodlo sie" 
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_path(@topic) }
      format.json { head :no_content }
    end
  end
end
