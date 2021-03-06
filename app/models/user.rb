class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :username, presence: true
  has_many :rounds

  include BCrypt


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
