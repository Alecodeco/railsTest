class ArticlesController < ApplicationController

before_action :set_article, only: [:edit, :update, :show, :destroy]
before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def edit
  end

  def show
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Updated OK"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @article = Article.paginate(page: params[:page], per_page: 3)
  end

  def create
    #debugger
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article created OK"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article susscessfully destroyed"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title,:description)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
