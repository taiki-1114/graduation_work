class Admin::BaseController < ApplicationController
  before_action :check_admin
  
  private

  def not_authenticated
    flash[:warning] = 'ログインしてください'
    redirect_to admin_login_path
  end

  def check_admin
    redirect_to root_path, danger: '管理者のみ利用可能な機能です' unless current_user.admin?
  end
end