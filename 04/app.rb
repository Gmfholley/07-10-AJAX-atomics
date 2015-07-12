require "sinatra"

get "/" do
  erb :"home"
end

get "/:msg" do
  message = params["msg"]
  return "You wrote #{message}"
end