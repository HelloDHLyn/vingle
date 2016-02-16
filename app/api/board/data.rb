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
      get do
        Article.find(params[:id])
      end
    end
  end
end