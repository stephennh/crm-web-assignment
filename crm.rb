# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative "contact"
require "sinatra"

Contact.create("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
Contact.create("Steve", "Jobs", "steve@apple.com", "Co-Founder")
Contact.create("Bill", "Gates", "bill@microsoft.com", "CEO")


get "/" do
  @crm_app_name = "Stephen's CRM"
  return erb(:index)
end

get "/contacts" do
  return erb(:contacts)
end

get "/contacts/new" do
  return erb(:new_contact)
end
