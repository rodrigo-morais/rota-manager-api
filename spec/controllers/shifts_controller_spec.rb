require "rails_helper"

RSpec.describe "Shifts API", type: :request do
  let!(:my_shifts) do
    create :shift,
      role_id: 1,
      start_time: DateTime.new(2001,2,3,4,5,6),
      end_time: DateTime.new(2001,2,3,6,0,0),
      staff_required: 5,
      number_of_invited_staff: 3,
      job_type: "Waiting staff"
  end

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
end
