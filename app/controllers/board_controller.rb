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

  def comment
    @comment = Comment.new(comment_param)
    if @comment.save
      redirect_to '/board/'+params[:comment][:article]
    else
      render 'write'
    end
  end

  def detail
  end

  private
    def article_param
      params.require(:article).permit(:title, :content, :writer)
    end

    def comment_param
      params.require(:comment).permit(:article, :content, :writer)
    end
end
