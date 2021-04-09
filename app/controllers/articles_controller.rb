class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def show
    #@article = Article.find(params[:id])
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit # go to Article table and find by id
    #@article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    # require top level article object, and permit to use title and description
    if @article.save
    #redirect_to article_path(@article)  This is same to the below code.
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    #@article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:notice] = "Article was updated successfully."
        redirect_to @article
      else
        render 'edit'
      end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end  


  
  private # anything below it is a private method.

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.User
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end

  
end
