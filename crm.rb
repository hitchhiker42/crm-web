# This is like all the mathy/functional/'method' ey stuff
require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

get '/' do
	@crm_app_name = "My CRM" # @ symbol has nothing to do with OOP. 
	@num = 1+2 # @ symbol is preparing a variable for view
	erb :index # tells you to send off everything above it ot index.erb
	# ^ its also sending everything off to the client
end

get '/contacts' do 
	@contacts = []
  @contacts << Contact.new(1, "Yehuda", "Katz", "yehuda@example.com", "Developer")
  @contacts << Contact.new(2, "Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  @contacts << Contact.new(3, "Sergey", "Brin", "sergey@google.com", "Co-Founder")


	erb :contacts
end
