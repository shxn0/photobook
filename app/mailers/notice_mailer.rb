class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_wall.subject
  #
  def sendmail_wall(wall)
    @greeting = "Hi"

    mail to: "pokopanic19@gmail.com",
      subject: '【Wall】投稿されました！'
  ends
end
