class ContactsController < ApplicationController
  
  def index
  end

  def new
    @contact = Contact.new
  end
  
  def create
    redirect_to contacts_path
  end

end
