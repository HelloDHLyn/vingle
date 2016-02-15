class MembersController < ApplicationController
  def new
  end

  def login
  end

  def checkout
    user = Member.find_by(userid: params[:member][:userid].downcase, password: params[:member][:password])
    if user
      session[:userid] = user.userid
      redirect_to '/board'
    else
      flash[:danger] = '아이디나 비밀번호가 틀립니다.'
      render 'login'
    end
  end
end
