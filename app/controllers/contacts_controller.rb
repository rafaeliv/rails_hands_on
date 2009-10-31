class ContactsController < ApplicationController
  MIN_ADDRESSES = 3
  MIN_RELATIONSHIPS = 3
  
  # contacts_controller.rb
  def shared
    @contact ||= Contact.find_by_signature(params[:contact_id] || params[:id])
  end
  
  def friends
    @contacts = Contact.find(:all,:joins => [:relationships => :group], :conditions => ["groups.name = ?",'friends'])
    render :action => 'index'
  end
  
  def index
    respond_to do |format|
      format.html do
        value = params[:search]
        @contacts = search value
        render :template => 'contacts/index'
      end
      format.json do
        value = params[:value]
        @contacts = search value
        render :text => @contacts.map{ |c| c.email }.to_json
      end
    end
    
    
    
    
  end

  
  def new
    @contact = Contact.new
    MIN_ADDRESSES.times do
      @contact.addresses.build
    end
    MIN_RELATIONSHIPS.times do
      @contact.relationships.build
    end
    @contact.assets.build
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Todo genial! #{@contact.first_name} salvado"
      redirect_to contacts_path
    else
      (MIN_ADDRESSES - @contact.addresses.length).times  do
        @contact.addresses.build
      end
      render :action => 'new'
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
    @contact.addresses.build
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Todo genial! #{@contact.first_name} actualizado"
      redirect_to contacts_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end
  private
  
    def search(value)
      conditions = ['contacts.email like ? ', "%#{value}%"] if value
      Contact.paginate :page => params[:page], :per_page => 2, :order => 'created_at DESC', :include => [:relationships => :group], :conditions => conditions


     # Contact.all(:include => [:relationships => :group], :conditions=> conditions, :limit => 10)
    end  

end
