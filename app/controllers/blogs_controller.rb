require 'will_paginate/array'

class BlogsController < ApplicationController
  before_filter :admin_privilege, :only => [:new, :create, :edit, :destroy]
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])

    if @blog.save
      puts "----------- yes ----------------- "
      redirect_to root_path
      flash[:success] = "Blog Successfully Created."
      return
    end

    respond_to do |format|
      format.html {render 'new'}
   #   format.json {render json: @blog}
    end
  end

  def download
#    send_file "/home/saurabh/rails/sskj_website/public/proposal_ogdf.pdf", :type => 'application/pdf', :x_sendfile => true
    send_file "/home/saurabh/sskj_personal/public/proposal_ogdf.pdf", :type => 'application/pdf', :x_sendfile => true
    # send_file('/home/saurabh/rails/sskj_website/public/proposal_ogdf.pdf')
  end

  def index
    @blogs = Blog.all
    @blogs = @blogs.paginate(page: params[:page], per_page: 5)
    respond_to do |format|
        format.html {render }
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments

    respond_to do |format|
      if current_admin
        format.html{render layout: 'user_layout'}
      elsif current_user
        format.html{render layout: 'admin_layout'}
      else
        format.html {render }
      end
    end

  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
