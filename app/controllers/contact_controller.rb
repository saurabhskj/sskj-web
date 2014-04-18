class ContactController < ApplicationController
#  layout 'user_layout'
  def new
    @contact = Contact.new
    puts "\n\n ---------- NEW -------------- \n\n"
  end

  def create
    puts "------------ Contact details --------------  #{params[:contact]}"
    @contact = Contact.new(params[:contact])

    if @contact.save
      redirect_to root_path
      flash[:contact_success] = "Thanks for contacting me. I will reply back to your queries at the earliest possible."
      return
    else
      flash[:contact_error] = "Please fill in all the asterisk (*) marked fields."
      redirect_to contact_path
      return
    end


    respond_to do |format|
      format.html {render 'new'}
      format.json {render json: @contact}
    end
  end

  def index

  end

  def show

  end
end
