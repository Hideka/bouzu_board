class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy]

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
    article = Article.new(article_params)
    article.user_id = current_user.id
    article.board_id = params[:board_id]
    article.save
    redirect_to action: :index
  end

  def edit
    @article = Article.find(params[:id])
    @board = Board.find(params[:board_id])
  end 
 
  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to board_articles_path(params[:board_id])
  end

  def destroy
    @article.destroy
    redirect_to board_articles_path
  end

  private
  def article_params
    params.require(:article).permit(:content)
  end
  def set_article
    @article = Article.find(params[:id])
  end

end
