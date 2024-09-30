class GoogleLoginApiController < ApplicationController
  require 'googleauth/id_tokens/verifier'

  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token
  skip_before_action :require_login, only: %i[callback verify_g_csrf_token]

  def callback
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: '308446653882-0qgapqvlkbc2l1sh9t1af5sed3d432qn.apps.googleusercontent.com')
    user = User.find_or_create_by(email: payload['email'])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to root_path, notice: '不正なアクセスです'
    end
  end

end
