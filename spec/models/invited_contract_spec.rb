require "rails_helper"

RSpec.describe "Invited Contract Model" do
  let!(:shift)  { create :shift }

  describe "role_id" do
    let!(:role_id) { create :invited_contract }
    let!(:tom_role_1)  { create :invited_contract, :tom_role_1 }
    
    it "filters for a given role id" do
      expect(InvitedContract.role_id(1).first.role_id).to eq(1)
    end 

    it "returns all role ids 1" do
      expect(InvitedContract.role_id(1).count).to eq(2)
    end 

    it "no available role id" do
      expect(InvitedContract.role_id(2)).to be_empty
    end
  end

  describe ".filter" do
    let!(:my_invited_contracts) { create :invited_contract }

    context "no role id given" do
      it "return all invited contracts" do
        expect(InvitedContract.filter(nil).count).to eq(InvitedContract.all.count)
      end
    end

    context "given an invalid role id" do
      it "doesn't return invited contracts" do
        expect(InvitedContract.filter(2)).to be_empty
      end
    end

    context "given an available role id" do
      it "returns all invited contracts to the role id informed" do
        expect(InvitedContract.filter(1).count).to be > 0
      end
    end
  end
end
