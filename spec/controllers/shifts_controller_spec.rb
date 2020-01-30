require "rails_helper"

RSpec.describe "Shifts API", :type => :request do
  let!(:my_shifts) { create :shift }

  it "responds with 200" do
    get "/shifts"
    expect(response).to be_ok
  end

  it "responds with shift data" do
    get "/shifts"
    expect(response.body).to include(my_shifts.to_json)
  end
end
