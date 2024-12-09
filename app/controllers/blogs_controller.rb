class BlogsController < ApplicationController
  
  def show
    @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.all 
  end

  def new
    # When we redirect from create route then only we have @blog, but in out new.html.erb file we don't have @blog for the first
    # time, so we create a blog instance here to get rid to that edge case
    
    @blog = Blog.new()
  end

  def create
    # render plain: params[:blog]
    
    # @blog = Blog.new(params[:blog]) <- This doesn't work because from Rails 4 onwards it does the security check for what data
    # is comming from the web.
    
    @blog = Blog.new(params.require(:blog).permit(:title, :description))
    # render plain: @blog.inspect
    
    if @blog.save
      # After saving to the database rails doesn't know what to do, so we redirect ruby to that blog which is created.
      redirect_to blog_path(@blog)
    else
      render "new"
    end
    
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(params.require(:blog).permit(:title, :description))
      redirect_to @blog
    else
      render "edit"
    end
    
  end

end