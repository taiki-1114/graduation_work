class UserMailer < ApplicationMailer
  default from: 'kame.taiki@gmail.com'

  def new_article_notification(article)
    @article = article
    mail(to: 'kame.taiki@gmail.com', subject: '新しい記事が投稿されました')
  end
end
