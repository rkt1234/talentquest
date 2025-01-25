class Auth::AuthenticationController < ApplicationController
  before_action :get_user_details
  skip_before_action :verify_authenticity_token

  def signup
    begin
      examinee = Examinee.new(name: @name, email: @email, password: @password)
      if examinee.save
        puts "Examinee created successfully!"
        payload = { 
          user_id: examinee.id, 
          email: examinee.email, 
          name: examinee.name
        }
        # Generate the JWT token using the JwtService
        @token = JwtService.encode(payload)
        @message = "Registration successful"
        @status_code = 200
      end
    rescue ActiveRecord::RecordNotUnique => e
      @message="E-mail already exists"
      @status_code = 400 
    end
    ensure
      render :signup, formats: :json
  end

def signin
  begin
    # Find the examinee by email
    examinee = Examinee.find_by(email: @email)

    # Check if examinee exists and if the password matches the hashed password
    if examinee && examinee.authenticate(@password)  # authenticate checks the password hash automatically
      puts "Examinee logged in successfully!"

      # Prepare payload for the JWT token
      payload = {
        user_id: examinee.id,
        email: examinee.email,
        name: examinee.name
      }

      # Generate the JWT token using the JwtService
      @token = JwtService.encode(payload)
      @message = "Login successful"
      @status = 200
    else
      @message = "Invalid email or password"
      @status = 400
    end
  rescue ActiveRecord::RecordNotFound => e
    @message = "Examinee not found"
    @status = 404
  end
ensure
  # Return a response with the message and token
  render json: { message: @message, token: @token, status: @status }
end


  def get_user_details
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
    puts @email
    puts @password
    # Now @email and @password are available throughout the controller
  end
end
