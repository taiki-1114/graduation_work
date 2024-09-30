class ApplicationController < ActionController::Base
  #アプリケーション全体を制御するコントローラー
    before_action :require_login

    private

  def not_authenticated
    redirect_to login_path
  end
end
