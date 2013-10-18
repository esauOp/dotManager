class TaskMailer < ActionMailer::Base
  default from: Settings.email.notifications_mail #"notification@mail.com"

  def notification_email(user, title)
  	@user = user
  	@title = title
  	@url = "www.oursite.com"
  	mail(to: @user.email, subject: "Hello!")
  	
  end

end
