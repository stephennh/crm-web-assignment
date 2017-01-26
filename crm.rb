# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative "contact"
require "sinatra"

# Contact.create("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
# Contact.create("Steve", "Jobs", "steve@apple.com", "Co-Founder")
# Contact.create("Bill", "Gates", "bill@microsoft.com", "CEO")

# --------Home Page---------
get "/" do
  @crm_app_name = "Stephen's CRM"
  return erb(:index)
end

# ---------Contacts Home Page----------
get "/contacts" do
  @count = Contact.all.count
  #links to contacts.erb file
  return erb(:contacts)
end

# --------Create a New Contact Page----------
get "/contacts/new" do
  #links to new_contact.erb
  return erb(:new_contact)
end

# --------Creating a Contact Page-----------
post "/contacts" do
  contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to ("/contacts")
end

# --------Viewing Specific Contact----------
get "/contacts/:id/view" do
  @contact = Contact.find(params[:id].to_i)
  return erb(:show_contact)
end

# ---------Editing Contact----------
get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb(:edit_contact)
  else
    raise Sinatra::NotFound
  end
end

# --------Editing Contact Page Input--------
put "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact.update({
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note],
    })
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

# ---------Deleting Contact----------
get "/contacts/:id/delete" do
  contact = Contact.find(params[:id].to_i)
  if contact
    contact.delete
  else
    raise Sinatra::NotFound
  end
  redirect to ("/contacts")
end


after do
  ActiveRecord::Base.connection.close
end
