class AdminMailer < ApplicationMailer
  default from: 'donotreply@example.com'
  layout 'mailer'

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: @email, subject: 'New User Awaiting Admin Approval')
  end

  def account_approval(email)
    @email = email
    mail(to: @email, subject: 'Your Account has been Approved')
  end
end