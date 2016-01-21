class UsersMailer < ActionMailer::Base
  default from: "marc.wright@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to What Can I Bring!')
  end
end
