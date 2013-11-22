# my_app.rb
require 'sinatra/base'

class ShelfApp < Sinatra::Base  
  get '/' do
    "Hello World"
  end
  
  run! if app_file == $0
end