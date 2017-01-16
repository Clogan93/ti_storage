class ContactsController < ApplicationController
  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.js { render nothing: true, status: 200 }
      else
        format.html { render :new }
        format.js { render json: 'An error occured. Please try again.', status: 500 }
      end
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :is_customer, :marketing_channel, :site, :message)
    end
end
