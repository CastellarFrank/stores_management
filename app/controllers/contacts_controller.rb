class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    @store = Store.find(@contact.store_id)

    if @contact.save
      SystemMailer.contact_message(@contact, @store, cookies.signed[:user_email]).deliver
      flash[:notice] = "Your message to the store: [#{@store.name}] has been sent."
      redirect_to home_index_path
    else
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit!
    end

end
