namespace :addresses do
  
  desc "Add kind of service to each address instance"
  task :add_kind => :environment do
    Address.all.each do |address|
      
      address.set_kind
      address.save
      puts "#{address[:type]}: #{address[:name]} #{address[:kind]} UPDATED!"
    end
    
  end
end
