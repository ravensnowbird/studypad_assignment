class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :name, :published
  
  before_create :set_published_status
  
  def set_published_status
    if self.user.reporter? 
      self.published = false 
    else
       self.published = true
    end
    return true
  end
  
end
