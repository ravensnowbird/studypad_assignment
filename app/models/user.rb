class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_type, :name
  # attr_accessible :title, :body
  
  has_many :articles
  
  before_create :update_user_type
  
  def update_user_type
    self.user_type = "reporter" if self.user_type.blank?
  end
  
  def reporter?
    self.user_type == "reporter"
  end
  
  def admin?
    self.user_type == "admin"
  end
  
  def editor?
    self.user_type == "editor"
  end
  
end
