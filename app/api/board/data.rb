module Board
  class Data < Grape::API
    resource :articles do
      desc "List all Articles"
      get do
        Article.all
      end
    end

    resource :article do
      desc "Get single Article"
      params do
        requires :id, type:String
      end
      get do
        Article.find(params[:id])
      end
    end

    resource :comments do
      desc "List all Comments for Article"
      params do
        requires :article, type:Integer
      end
      get do
        Comment.where(article: params[:article])
      end
    end
  end
end