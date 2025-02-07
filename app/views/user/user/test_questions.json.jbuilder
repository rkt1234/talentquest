json.test_sections @test.attributes["sections"]
json.message @message
json.status @status_code 
json.test_instructions JSON.parse(@test_instructions.attributes["instructions"])