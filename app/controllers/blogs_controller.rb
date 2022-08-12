class BlogsController < ApplicationController 
  access all: [:show, :index], user: {except: [:new, :create, :edit, :update, :destroy, :toggle_status]}, admin: :all
  layout "blog"
  def index 
    @blogs = Blog.all 
    @page_title = "Zakir Hussain | Blog"
  end

  def new 
    @blog = Blog.new 
  end

  def create 
    @blog = Blog.new(blog_params)
    if @blog.save 
      redirect_to @blog, notice: "Blog Created Successfully"
    else
      fail
      render :new 
    end 
  end 

  def show 
    @blog = Blog.find(params[:id])
  end

  def edit 
    @blog = Blog.find(params[:id])
  end

  def update 
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog updated"
    else
      render :edit 
    end
  end

  def toggle_status 
    @blog = Blog.find(params[:id])
    
    if @blog.draft? 
      @blog.published! 
    else
      @blog.draft! 
    end 
    redirect_to blogs_path, notice: 'Status updated!'
  end

  def destroy 
    @blog = Blog.find(params[:id])
    @blog.destroy 
    redirect_to blogs_url 
  end

private 
  def blog_params 
    params.require(:blog).permit(:title, :body)
  end
end