require 'digest/md5'

class MembersController < ApplicationController
  def new
  end

  def create
    @member = Member.new(member_param)
    @member.password = Digest::MD5.hexdigest(@member.password)
    if @member.save
      redirect_to '/login'
    else
      flash[:danger] = '가입에 실패했습니다.'
      render 'new'
    end
  end

  def login
  end

  def checkout
    user = Member.find_by(userid: params[:member][:userid].downcase, password: Digest::MD5.hexdigest(params[:member][:password]))
    if user
      session[:userid] = user.userid
      redirect_to '/board'
    else
      flash[:danger] = '아이디나 비밀번호가 틀립니다.'
      render 'login'
    end
  end

  private
    def member_param
      params.require(:member).permit(:userid, :password)
    end
end
