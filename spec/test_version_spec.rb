require 'spec_helper'

describe Litmus::TestVersion do
  describe ".show" do
    it "should give me back a test version object" do
      test_version = Litmus::TestVersion.show(1716450, 1)
      test_version["version"].should == 1
    end
  end

  describe ".list" do
    it "should give me back a an array of test versions" do
      test_versions = Litmus::TestVersion.list(1715760)
      test_versions.size.should == 1
      test_versions.first["version"].should == 1
    end
  end

  describe ".create" do
    it "should give a new test version object" do
      test_version = Litmus::TestVersion.create(1715760)
      test_version["version"].should == 2
    end
  end

  describe ".poll" do
    it "should give a simplified test verison" do
      test_version = Litmus::TestVersion.poll(1715760, 1)
      test_version["version"].should == 1
      test_version["results"].size.should == 17
      test_version["results"].first["state"].should == "complete"
    end
  end
end