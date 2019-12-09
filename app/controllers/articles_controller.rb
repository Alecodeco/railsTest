class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Updated OK"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @article = Article.all
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article created OK"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article susscessfully destroyed"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title,:description)
  end

end
