class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :products
  has_one :user_location
  alias_attribute :location, :user_location
  
  has_one :preference
  after_create :create_preference
  
  def owns?(product)
    products.include? product
  end

  def display_name 
    preference.display_name
  end
  
end
