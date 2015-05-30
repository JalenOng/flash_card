class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :guesses, through: :rounds

  validates :username, presence: true
  validates :password, presence: true

  def self.authenticate(username, password)
    @user = User.find_by(username: username)

    if @user && @user.password == password
      @user
    else
      nil
    end
  end

end
