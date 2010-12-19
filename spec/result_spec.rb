require 'spec_helper'

describe Litmus::Result do
  describe ".list" do
    it "should give me an array of results" do
      results = Litmus::Result.list(1715760, 1)
      results.count.should == 17
      results.first["result_images"].first["full_image"].should =~ /s3.amazonaws.com/
    end
  end

  describe ".show" do
    it "should return a result object" do
      result = Litmus::Result.show(1715760, 1, 33524970)
      result["id"].should == 33524970
      result["result_images"].first["full_image"].should =~ /s3.amazonaws.com/
    end
  end
end