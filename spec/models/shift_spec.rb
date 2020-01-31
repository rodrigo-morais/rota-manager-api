require "rails_helper"

RSpec.describe "Shift Model" do


  describe "job_type" do
    let!(:barista_shift)  { create :shift, :barista }
    
    it "filters for a given job type" do
      expect(Shift.job_type("Barista").first.job_type).to eq("Barista")
    end 

    it "no available job type" do
      expect(Shift.job_type("Waiting staff")).to be_empty
    end
  end

  describe "start_time" do
    let!(:am_shift)  { create :shift, :am }
    let!(:pm_shift)  { create :shift, :pm }
    
    it "filters for a given start time" do
      expect(Shift.start_time("am").count).to eq(1)
    end 
  end

  describe ".filter" do
    let!(:my_shifts) { create :shift, :waiting_staff_pm }

    context "no job type and period given" do
      it "return all shifts" do
        expect(Shift.filter(nil, nil).count).to eq(Shift.all.count)
      end
    end

    context "no job type given" do
      it "doesn't return shifts" do
        expect(Shift.filter(nil, "am")).to be_empty
      end
    end

    context "no period given" do
      it "doesn't return shifts" do
        expect(Shift.filter("Barista", nil)).to be_empty
      end
    end

    context "given an available job type and an invalid period" do

      it "doesn't return shifts" do
        expect(Shift.filter("Waiting staff", "am")).to be_empty
      end
    end

    context "given an available period and an invalid job type" do
      it "doesn't return shifts" do
        expect(Shift.filter("Barista", "pm")).to be_empty
      end
    end

    context "given an available job type and period" do
      it "returns all shifts to the job type and period informed" do
        expect(Shift.filter("Waiting staff", "pm").count).to be > 0
      end
    end
  end
end
