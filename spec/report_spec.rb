require 'spec_helper'

describe Litmus::Result do
  describe ".list" do
    it "should give me an array of results" do
      results = Litmus::Report.list
      results.count.should == 3
      results.first["id"].should == 24
    end
  end

  describe ".show" do
    it "should return a result object" do
      result = Litmus::Report.show(24)
      result["id"].should == 24
    end
  end

  describe ".create" do
    it "should return success" do
      result = Litmus::Report.create("Newsletter")
      result["id"].should == 24
      result["report_name"].should == 'Newsletter'
    end
  end
end
