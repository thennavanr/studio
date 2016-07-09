class Contact < ActiveRecord::Base
  validates :name,   :presence => {message: "Name cann't be empty"},:length => {:minimum => 2, :message => "Name is too short"}
  validates :subject,  :presence => true, :length => {:minimum => 5}
  validates :message, :presence => true, :length => {:minimum => 30}
  validates :email, :presence => true, :email => true
end
