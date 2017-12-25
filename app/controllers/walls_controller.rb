class WallsController < ApplicationController
  before_action :authenticate_user!
  before_action :wall_set, only: [:show, :edit, :update, :destroy]

  def index
    @walls = Wall.all.order(:created_at).reverse_order
  end

  def new
    @wall = Wall.new
  end

  def create
    @wall = Wall.new(walls_params)
    @wall.user_id = current_user.id
    if @wall.save
      redirect_to walls_path, notice: "投稿しました！"
      NoticeMailer.sendmail_wall(@wall).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @wall.update(walls_params)
    redirect_to walls_path, notice: "更新しました！"
  end

  def show
  end

  def destroy
    @wall.destroy(walls_params)
    redirect_to walls_path, notice: "削除しました！"
  end

  private
    def walls_params
      params.require(:wall).permit(:title, :content)
    end

    def wall_set
      @wall = Wall.find(params[:id])
    end



end
