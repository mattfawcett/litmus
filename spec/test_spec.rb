require 'spec_helper'

describe Litmus::Test do
  describe ".show" do
    it "should give back the test object" do
      test = Litmus::Test.show(1716450)
      test["id"].should == 1716450
    end
  end
end