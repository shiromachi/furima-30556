class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(text: params[:comment][:text])
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end
end
