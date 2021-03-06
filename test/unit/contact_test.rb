require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class ContactTest < ActiveSupport::TestCase

  describe "Contact" do

    it "should validates presence of email" do
      @contact = Contact.make_unsaved
      @contact.email = nil
      @contact.should_not be_valid
    end

    it "should validates presence of first name" do
      @contact = Contact.make_unsaved
      @contact.first_name = nil
      @contact.should_not be_valid
    end

    it "should validates presence of last name" do
      @contact = Contact.make_unsaved
      @contact.last_name = nil
      @contact.should_not be_valid
    end

  end
end
