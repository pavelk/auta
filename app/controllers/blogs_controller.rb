class BlogsController < FrontendController
  
  add_crumb ('Aktuality') { |instance| instance.send :blogs_path }
  before_filter :load_blog, :only => [:show]
  
  private
  
    def load_blog
      @blog = Blog.find(params[:id])
      add_crumb @blog.name
    end
  
end
