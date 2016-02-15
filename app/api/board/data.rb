module Board
  class Data < Grape::API
    resource :articles do
      desc "List all Articles"
      get do
        Article.all
      end
    end
  end
end