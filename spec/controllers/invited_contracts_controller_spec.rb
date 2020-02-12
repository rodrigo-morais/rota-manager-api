require "rails_helper"

RSpec.describe "Invited Contracts API", type: :request do
  let!(:shift_role_1)  { create :shift }
  let!(:shift_role_2)  { create :shift, :role_2 }
  let!(:my_invited_contract) { create :invited_contract }

  it "responds with 200" do
    get "/invited_contracts"
    expect(response).to be_ok
  end

  it "responds with invited contract data" do
    get "/invited_contracts"
    expect(response.body).to eq([{
      roleId: 1,
      candidateName: "Paul"
    }].to_json)
  end

  context "filter by role id" do
    it "returns an empty list of invited contracts when the role id doesn't exist" do
      get "/invited_contracts?roleId=3"
      expect(JSON.parse(response.body)).to be_empty
    end

    it "returns all invited contracts with the role id given" do
      create(:invited_contract, :tom_role_2)
      create(:invited_contract, :will_role_2)
      get "/invited_contracts?roleId=2"
      JSON.parse(response.body).each { |invited_contract| 
        expect(invited_contract["roleId"]).to eq(2)
      }
    end
  end
end
