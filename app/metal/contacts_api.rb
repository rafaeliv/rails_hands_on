# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class ContactsApi
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/contacts_api/
      [200, {"Content-Type" => "text/html"}, [get_contacts]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
  private
    def self.get_contacts
      Contact.all(:include => :addresses).to_json( :except => [:created_at, :updated_at], :include =>:addresses)
    end
end

