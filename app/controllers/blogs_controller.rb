class BlogsController < ApplicationController
  before_action :set_blog, only: [ :show, :edit, :update, :destroy ]
  
  # Showing particular blog ( URL : localhost/blogs/:id )
  
  def show
  end

  # Showing all the blogs ( URL : localhost/blogs )

  def index
    @blogs = Blog.all 
  end

  # Creating new Blogs ( URL : localhost/blogs/new )

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

  # Editing the blogs ( URL : localhost/blogs/:id/edit )

  def edit
  end

  def update
    if @blog.update(params.require(:blog).permit(:title, :description))
      redirect_to @blog
    else
      render "edit"
    end
  end

  # Deleting the blogs

  def destroy
    @blog.destroy

    redirect_to blog_path
  end

  private
    
    def set_blog
      @blog = Blog.find(params[:id])
    end

end

# So, in this controller in Edit, Update, Delete, Show actions we are repeating ourself with { @blog = Blog.find(params[:id]) }
# this code so to inhance our code we can create a priavte function that covers this code and just calling it before any of
# the concern actions runs.