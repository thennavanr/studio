class ContactusController < ApplicationController
  def index
    @contact = Contact.new
  end
  def update
    @contact = Contact.new(contactus_params)
    if @contact.save
      mail1  = FeedBackMailer.feed_back_email(@contact).deliver
      mail2 = FeedBackMailer.contact_us_email(@contact).deliver

      flash[:notice] = 'Thanks for Your Message, will contact you asap.'
      @contact = Contact.new
      render 'index'
    else
      flash[:notice] = 'Error:'
      render 'index'
    end

  end
  def contactus_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end 
end
