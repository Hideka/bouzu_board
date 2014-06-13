class ArticlesController < ApplicationController

  def index
    #@articles = Article.where(board_id: params[:board_id])
    @board = Board.find(params[:board_id])
    @articles = @board.articles  
  end

  def show
    @article = Article.find(params[:id])
  end

  def new 
    @board = Board.find(params[:board_id])
    @article = Article.new
  end

  def create
    article = Article.new
    article.user_id = params[:user_id]
    article.board_id = params[:board_id]
    article.content = params[:content]
    article.created_at = params[:ceated_at]
    article.save
    redirect_to action: :index
  end

  def edit
    @article = Article.find(params[:id])
  end
 
  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to article_path(article.id)
  end

  def destroy
    @article.destroy
    redirect_to article_path
  end

  private
  def article_params
    params.require(:article).permit(:content)
  end

end
