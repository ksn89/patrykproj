class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirm_email(project, member, token)
    @member = member
    @project = project
    @url = 'localhost:3000'+token
    mail(to: @member.email_member, subject: 'Welcome to My Awesome Site')
  end


end
