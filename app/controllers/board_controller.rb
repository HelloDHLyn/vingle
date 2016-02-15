class BoardController < ApplicationController
  def view
  end

  def write
  end

  def create
    @article = Article.new(article_param)
    if @article.save
      render 'view'
    else
      render 'write'
    end
  end

  private
    def article_param
      params.require(:article).permit(:title, :content, :writer)
    end
end
