require 'pony'
require 'highline/import'

via_options = {
  :address              => 'smtp.gmail.com',
  :port                 => '587',
  :enable_starttls_auto => true,
  :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
  :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
}


print "Enter your gmail username: "
user_name = gets.chomp

# use highline instead of gets, to prevent password printing to the screen
# password = gets.chomp
password = ask("Please enter your password: ") {|q| q.echo = false}

Pony.options = {:via => 'smtp', :via_options => via_options.merge({:password => password, :user_name => user_name})}

# to actually send the email
Pony.mail(:to => "contact@ticklo.com", :subject => "Hello!!! Woo email!", :body => "Im learning how to send emials via Ruby, using a pony gem :) Hope you like this.. Welcome to delete this email :) Sexciiii  ")