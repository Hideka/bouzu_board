class BoardsController < ApplicationController
  def index
    @boards = Board.all 
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.new
    board.title = params[:title]
    board.intro = params[:intro]
    board.created_at = params[:created_at]
    board.save
    redirect_to action: :index
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update(board_params)
    redirect_to board_path(board.id)
  end

  def destroy
    @board.destroy
    redirect_to board_path
  end

  private
  def board_params
    params.require(:board).permit(:title, :intro)
  end

end
