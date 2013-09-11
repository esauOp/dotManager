class TaskMailer < ActionMailer::Base
  default from: "notification@doter.mx" #Settings.email.notifications_mail # 

  def notification_email(user)
  	@user = user
  	@url = "www.doter.mx"
  	mail(to: @user.email, subject: "Hello!")
  	
  end

end
