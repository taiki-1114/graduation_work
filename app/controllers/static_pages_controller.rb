class StaticPagesController < ApplicationController
  skip_before_action :require_login
  #個人情報の保護方針、利用規約ページを制御するコントローラー
  def terms_of_service
  end

  def privacy_policy
  end
end
