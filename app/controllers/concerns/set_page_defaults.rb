module SetPageDefaults 
  extend ActiveSupport::Concern 

  included do 
    before_action :set_defaults 
  end
  
  def set_defaults 
    @page_title = "Zakir H."
    @seo_keywords = "Ruby Ruby-On-Rails Web Development Software Engineer PostgreSQL Developer"
  end
end