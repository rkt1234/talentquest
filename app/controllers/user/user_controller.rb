class User::UserController < ApplicationController 
  skip_before_action :verify_authenticity_token

def home
  puts "inside this"
  begin
    puts params[:ongoing_status]
    page = params[:page].to_i || 1
    per_page = 1
    # Fetch only specific columns from the tests table
@all_tests = Test.select(:id, :test_name, :organization_name, :duration, :ongoing_status, :full_marks, :start_time, :end_time, :start_date, :end_date, :description)
                 .where(params[:ongoing_status] == 'all' ? nil : { ongoing_status: params[:ongoing_status] })
                 .limit(per_page).offset((page - 1) * per_page)

    if @all_tests.empty?
      @status_code = 200
      @message = "No tests available"
      @tests_list = []
    else
      @tests_list = @all_tests.map { |test| test.attributes }
      @status_code = 200
      @message = "Tests fetched successfully"
    end
  rescue ActiveRecord::RecordNotFound => e
    @status_code = 404
    @message = "Tests not found: #{e.message}"
  rescue StandardError => e
    @status_code = 500
    @message = "An unexpected error occurred: #{e.message}"
  ensure
    render :home, formats: :json
  end
end



  def my_results
    puts "hello ji ji"
  end

def fetch_test_sections
  begin
    @test = Test.select(:sections).find(params[:id])  # Using `find` to raise an exception if not found
    @test_instructions = Test.select(:instructions).find(params[:id])
    puts @test
    puts @test.attributes
    @status_code = 200
    @message = "Test fetched successfully"
  rescue ActiveRecord::RecordNotFound
    @status_code = 404
    @message = "Test not found"
    @test = nil
  rescue StandardError => e
    @status_code = 500
    @message = "An unexpected error occurred: #{e.message}"
    @test = nil
  ensure
    render :test_questions, formats: :json
  end
end

end