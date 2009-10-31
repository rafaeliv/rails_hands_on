class AddressesController < ApplicationController

  def index
    @addresses = Contact.find(params[:contact_id]).addresses
  end
  
#before_filter :get_contact  
  #def index
  #  @addresses = @contact.addresses
  #end

  #private
  #def get_contact
  #  @contact = Contact.find(params[:contact_id])
  #end
end
