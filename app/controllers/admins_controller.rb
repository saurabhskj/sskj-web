class AdminsController < ApplicationController
  before_filter :admin_privilege
  before_filter :authenticate
  layout 'admin_layout'

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    puts "testing ....!! #{params[:admin]}"
    respond_to do |format|
      if @admin.save
        #flash[:notice] = "User Created"
        format.html{ redirect_to '/' }
      else
        format.html {render 'new'}
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def index

  end

  def show

  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "saurabh12"
    end
  end

end