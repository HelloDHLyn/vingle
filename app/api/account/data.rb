module Account
  class Data < Grape::API
    resource :member do
      desc "List all Member"
      get do
        Member.all
      end

      desc "Create new member"
      params do
        requires :userid, type:String
        requires :password, type:String
      end
      
      post do
        Member.create!({
          userid:params[:userid],
          password:params[:password],
        })
      end
    end
  end
end