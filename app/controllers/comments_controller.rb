class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(text: params[:comment][:text])
    ActionCable.server.broadcast 'comment_channel', content: @comment if @comment.save
  end
end
