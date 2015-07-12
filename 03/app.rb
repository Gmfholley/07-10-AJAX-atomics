require "sinatra"

get "/" do
  erb :"home"
end

get "/path1" do
  return "yes"
end