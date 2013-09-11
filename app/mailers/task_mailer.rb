class TaskMailer < ActionMailer::Base
  default from: Settings.email.notifications_mail #"notification@mail.com"

  def notification_email(user)
  	@user = user
  	@url = "www.doter.mx"
  	mail(to: @user.email, subject: "Hello!")
  	
  end

end
