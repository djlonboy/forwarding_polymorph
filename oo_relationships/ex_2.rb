# class User
#   def initialize(name, bio, age, password)
#     @name = name
#     @bio = bio
#     @age = age
#     @password = password
#   end
#
#   def authenticate(candidate_password)
#     return true if candidate_password == @password
#     false
#   end
#
#   def profile
#     "#{@name}, born in #{birth_year}: #{@bio}"
#   end
#
#   private
#
#   def birth_year
#     Time.new.year - @age
#   end
# end

# Use a forwarding relationship to extract the authentication behaviour
# from User into another class.

# Draw a diagram first, then do the refactor on the code.

class Authenticate
  def initialize
    @user = User.new
    @password = @user.password
  end

  def authenticate(candidate_password)
    return true if candidate_password == @password
    false
  end
end

class User
  attr_reader :password

  def initialize(name, bio, age, password)
    @name = name
    @bio = bio
    @age = age
    @password = password
  end

  def profile
    "#{@name}, born in #{birth_year}: #{@bio}"
  end

  private

  def birth_year
    Time.new.year - @age
  end
end
