class FeedBackMailer < ApplicationMailer
  default from: 'feedback@ramsigman.com'

  def feedback_email(contact)
    mail(to: contact.email, subject: 'Feedback from site')
  end 
end

