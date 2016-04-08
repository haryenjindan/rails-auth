class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 2}
  has_secure_password
  
  def new?
    self.id.nil?
  end
end
