class ContactusController < ApplicationController
  def index
    @contact = Contact.new
  end
  def update
    @contact = Contact.new(contactus_params)
    if @contact.save
      flash[:notice] = 'Thanks for Your Message, will contact you asap.'
      render 'index'
    else
      flash[:notice] = 'Some error occured'
      render 'index'
    end

  end

  def contactus_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end 

end
