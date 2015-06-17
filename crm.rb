# This is like all the mathy/functional/'method' ey stuff
require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex = Rolodex.new #global variable allows the server not to forget between requests
$rolodex.add_contact(Contact.new("Yehuda", "Katz", "yehuda@example.com", "Developer"))
$rolodex.add_contact(Contact.new("Mark", "Zuckerberg", "mark@facebook.com", "CEO"))
$rolodex.add_contact(Contact.new("Sergey", "Brin", "sergey@google.com", "Co-Founder"))

get '/' do
	@crm_app_name = "My CRM" # @ symbol has nothing to do with OOP. 
	# @num = 1+2 # @ symbol is preparing a variable for view
	erb :index # tells you to send off everything above it ot index.erb
	# ^ its also sending everything off to the client
end

get '/contacts' do 
	# @contacts << Contact.new(1, "Yehuda", "Katz", "yehuda@example.com", "Developer")
	# @contacts << Contact.new(2, "Mark", "Zuckerberg", "mark@facebook.com", "CEO")
	# @contacts << Contact.new(3, "Sergey", "Brin", "sergey@google.com", "Co-Founder")
	erb :contacts
end


get '/contacts/new' do
	erb :new_contact
end

get '/contacts/:id' do
	@contact = $rolodex.find(params[:id].to_i)
	erb :show_contact
end

post "/contacts" do 
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')
end