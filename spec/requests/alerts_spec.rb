# https://relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec
require 'spec_helper'

# since Alerts inherits from API not Base, the class name is Alerts API not Alerts
RSpec.describe "Alerts API", type: :request do
  it "returns http status code 200 Success" do 
    get "/api/alerts"
    expect(response.status).to eq(200)
  end
end

RSpec.describe "Alerts API" do
  params = { 
    alert: {
      level: 10,
      user_id: 1,
    }
  }
  puts "params: #{params}"
  it "creates an new Alert object" do
    post "/api/alerts", params: params

    resp = JSON.parse(response.body)
    puts "response back: #{resp}"
  # issue seems to be that user does not exist but I know that this user exists because it was seeded
  # so why does testing not know about it? does RSpec automatically run in a different environment?
  # response code should be Status 201 Created
    expect(response.status).to eq(201)
  end
end

