require "spec_helper"

require "rack/test"
include Rack::Test::Methods

require_relative "../shelf_app"

describe ShelfApp do 
  def app
    ShelfApp.new
  end

  it "returns 200" do
  	response = get "/"
    response.status.should == 200
  end
  
  it "returns Hello World by default" do
  	response = get "/"
  	response.body.should == "Hello World"    
  end

  it "returns Hello Name if name is specified" do
    response = get "/", {"name" => "Ampersand"}
    response.body.should == "Hello Ampersand"
  end

end
