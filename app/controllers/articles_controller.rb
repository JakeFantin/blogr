class ArticlesController < ApplicationController
  def index
    @page_size = 16
    @last_page = (Article.count / 16.0).ceil
    if params[:page_number].to_i < 1
      redirect_to "/articles/pages/1"
    elsif params[:page_number].to_i > @last_page
      redirect_to "/articles/pages/#{@last_page}"
    end
    @page_number = params[:page_number].to_i
    @articles = Article.offset((@page_number - 1) * @page_size).limit(@page_size)
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

  # private
  #   def pagination_params
  #     params.permit(:next, :prev, :first, :last)
  #   end
end