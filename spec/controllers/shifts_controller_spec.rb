require "rails_helper"

RSpec.describe "Shifts API", type: :request do
  let!(:my_shifts) { create :shift }

  it "responds with 200" do
    get "/shifts"
    expect(response).to be_ok
  end

  it "responds with shift data" do
    get "/shifts"
    expect(response.body).to eq([{
      roleId: 1,
      startTime: "04:05",
      endTime: "06:00",
      staff_required: 5,
      number_of_invited_staff: 3,
      jobType: "Waiting staff"
    }].to_json)
  end

  context "filter by job type" do
    it "returns an empty list of shifts when the job type doesn't exist" do
      get "/shifts?jobType=Barista"
      expect(JSON.parse(response.body)).to be_empty
    end

    it "returns all shifts with the job type given" do
      create(:shift, :barista)
      get "/shifts?jobType=Barista"
      expect(JSON.parse(response.body).first["jobType"]).to eq("Barista")
    end
  end
end
