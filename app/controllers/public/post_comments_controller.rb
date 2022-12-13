class Public::PostCommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.review_id = review.id
    @post_comment.save
    redirect_to public_post_comments_path(review.id)
  end
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to public_review_path(params[:review_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
