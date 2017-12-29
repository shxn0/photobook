class CommentsController < ApplicationController
  before_action :set_comment, only:[:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comments_params)
    @wall = @comment.wall

    respond_to do |format|
      if @comment.save
        format.html { redirect_to walls_path(@wall), notice: "コメントしました！"}
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @wall = @comment.wall
  end

  def update
    @wall = @comment.wall
    if @comment.update(comments_params)
       redirect_to wall_path(@wall), notice: "コメントを更新しました！"
    else
      render "edit"
    end
  end


  def destroy
    # @comment = Comment.find(params[:id])
    @wall = @comment.wall

    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to walls_path(@wall), notice: "コメントを削除しました！"}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:wall_id, :context)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
