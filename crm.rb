# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative "contacts"
require_relative "new_contact"
require "sinatra"

Contact.create("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
Contact.create("Steve", "Jobs", "steve@apple.com", "Co-Founder")
Contact.create("Bill", "Gates", "bill@microsoft.com", "CEO")


get "/" do
  @crm_app_name = "Stephen's CRM"
  erb(:index)
end

get "/contacts" do

end

get "/contacts/new" do

end
