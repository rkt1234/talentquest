json.message @message
json.status @status_code
if !@token.nil?
  json.token @token
end