class CommentsController < ApplicationController
  def create
    # FORM TO BE IMPLMENTED ON INDEX PAGE
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    # if @comment.save!
    #   redirect_to posts_path
    # else
    #   render posts_path, status: :unprocessable_entity
    # end
    respond_to do |format|
      if @comment.save
        # notification = CommentNotification.with(comment: "#{@comment.user} left a comment on your post: '#{@comment.content.first(20)}'...")
        # Deliver notification immediately
        notification.deliver(@comment.post.user)
        format.html { redirect_to posts_path }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "posts/index", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    end
  end

  # CURRENTLY NO PLANS TO IMPLEMENT UPDATE ON A COMMENT
  # def update
  # end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
