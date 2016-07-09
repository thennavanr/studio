class MailPreview < MailView

  def feedback
    @contact = Contact.new(:name => "Thennavan Ramalingam", :email => 'thenns@gmail.com', :message => "hi, ramesh please contact me at 343-343-2342")
    mail = FeedBackMailer.feed_back_email(@contact)
  end

  def contact
    @contact = Contact.new(:name => "Thennavan Ramalingam", :email => 'thenns@gmail.com', :message => "hi, ramesh please contact me at 343-343-2342")
    mail = FeedBackMailer.contact_us_email(@contact)
  end
  
end
