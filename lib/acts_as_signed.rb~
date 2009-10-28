require 'active_support'
 
module Peterpunk
  module ActsAsSigned
    # Provides the base functionality for acts_as_signed
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
          add_acts_as_signed_module(Methods)
        end
      end
      
      module Config
        #
        # class User < ActiveRecord::Base
        # acts_as_signed do |config|
        #
        # end
        # end
        #
        def acts_as_signed(&block)
          
          yield self if block_given?
          acts_as_signed_modules.each { |mod| include mod }
 
        end
 
        #
        # hooking modules borrowed from authlogic
        #
        def add_acts_as_signed_module(mod, action = :append)
          modules = acts_as_signed_modules
          case action
          when :append
            modules << mod
          when :prepend
            modules = [mod] + modules
          end
          modules.uniq!
          write_inheritable_attribute(:acts_as_signed_modules, modules)
        end
        
        # This is the same as add_acts_as_signed_module, except that it removes the module from the list.
        def remove_acts_as_signed_module(mod)
          acts_as_signed_modules.delete(mod)
          acts_as_signed_modules
        end
        
        def signature_length(value=8)
          rw_config(:signature_length, value, :signature_length)
        end
        alias_method :signature_length=, :signature_length
 
        private
          def acts_as_signed_modules
            key = :acts_as_signed_modules
            inheritable_attributes.include?(key) ? read_inheritable_attribute(key) : []
          end
          
          def rw_config(key, value, default_value = nil, read_value = nil)
            if value == read_value
              inheritable_attributes.include?(key) ? read_inheritable_attribute(key) : default_value
            else
              write_inheritable_attribute(key, value)
            end
          end
          
      end
      module Methods
        def self.included(klass)
          klass.class_eval do
 
            include InstanceMethods
            extend ClassMethods
 
          end
        end
      end
 
      # Class level methods
      module ClassMethods
        #
        # locates an id based on signature
        #
        def find_by_signature(secret)
          return nil unless secret.kind_of?(String)
          id, signature = secret.split('-')
          instance = self.find(id)
          raise ActiveRecord::RecordNotFound if signature != self.sign(instance.id)
          instance
        end
 
        #
        # generate a sign according to length and id
        #
        def sign(id, length=signature_length)
          Digest::SHA1.hexdigest([self, id, SECRET].join)[0, length]
        end
      end
 
      # Instance level methods
      module InstanceMethods
        def signed_id
          "#{self.id}-#{self.class.sign(self.id)}"
        end
      end
      
 
    end
  end
end
 
if defined?(::ActiveRecord)
  module ::ActiveRecord
    class Base
      include Peterpunk::ActsAsSigned::Base
    end
  end
end
