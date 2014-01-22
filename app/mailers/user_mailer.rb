class UserMailer < ActionMailer::Base
  default from: "lolek@o2.pl"

  def confirm_email(project, member, token)
    @member = member
    @project = project
    @url = project_member_path(@project,@member)+token
    mail(to: @member.email_member, subject: 'Welcome to My Awesome Site')
  end


end
