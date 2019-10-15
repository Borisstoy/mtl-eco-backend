class AuthenticateUser
    prepend SimpleCommand
  
    def initialize(email, password)
        @email = email
        @password = password
    end
  
    def call
        JsonWebToken.encode(user_id: user.id, user_email: user.email) if user
    end
  
    private
  
    attr_accessor :email, :password
  
    def user
        user = User.find_by_email(email)
        puts "============================================"
        puts "USER EMAIL"
        puts user.email
        puts "============================================"
        puts "USER AUTHENTICATION"
        puts user.authenticate(password).email
        puts "============================================"
        return user if user && user.authenticate(password)
    
        errors.add :user_authentication, 'invalid credentials'
        nil
    end
  end