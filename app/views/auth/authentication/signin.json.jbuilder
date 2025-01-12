json.message @message
json.status @status
if !@token.nil?
  json.token @token
end