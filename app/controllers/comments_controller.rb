class CommentsController < ApplicationController
  def create
    # FORM TO BE IMPLMENTED ON INDEX PAGE
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    if @comment.save!
      redirect_to posts_path
    else
      render posts_path, status: :unprocessable_entity
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
