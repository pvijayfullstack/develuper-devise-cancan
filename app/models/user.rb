class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  # Associations
  has_and_belongs_to_many :roles
  
  #Setup default role
  after_save :default_role
  
  
  def role?(role)
      self.roles.any? { |r| r.name.underscore.to_sym == role }
  end
  
  private
     def default_role
       self.roles.create!(:name => :customer)
     end
  
end
