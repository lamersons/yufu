class UsersMailer < ActionMailer::Base
  def create(user)
    @user = user
    mail to: user.email, subject: t('devise.registrations.mailer.subject')
  end
end
