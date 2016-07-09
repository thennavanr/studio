class FeedBackMailer < ApplicationMailer
  default from: 'feedback@ramsigman.com'

  def feed_back_email(contact)
    @contact = contact
    mail(to: @contact.email , subject: '[no-reply] Thank you.')
  end 

  def contact_us_email(contact)
    @contact = contact
    mail(to: 'ram@ramsigman.com', subject: 'Contact from RamSigman.com')
  end

end

