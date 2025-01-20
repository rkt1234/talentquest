class User::UserController < ApplicationController 
  skip_before_action :verify_authenticity_token

  def home
  begin
    puts "inside home"
    
    # Fetch all tests from the database
    @tests = Test.all

    # Check if any tests are found
    if @tests.empty?
      @status = 404  # Not Found if no tests exist
      @message = "No tests available"
    else
      # Transforming each test record into a hash
      @tests_list = @tests.map do |test|
        test.attributes
      end
      @status = 200  # OK if tests are found
      @message = "Tests fetched successfully"
    end
  rescue ActiveRecord::RecordNotFound => e
    # Handle case where the query fails due to invalid records
    @status = 404
    @message = "Tests not found: #{e.message}"
  rescue StandardError => e
    # Handle any other unexpected errors
    @status = 500
    @message = "An unexpected error occurred: #{e.message}"
  
  ensure
    render :home, formats: :json
  end
  end

  def my_results
    puts "hello ji ji"
    
  end
end