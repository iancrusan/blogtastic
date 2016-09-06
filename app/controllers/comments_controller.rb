class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.html{redirect_to blog_post_path( @comment.blog_post_id), notice: 'Comment was successfully created.'}
      else
        format.html { redirect_to blog_post_path}
      end
    end
end

private

def comment_params
  params.require(:comment).permit(:author, :comment_entry, :blog_post_id, :user_id)
end
end
