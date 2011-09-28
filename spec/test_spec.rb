require 'spec_helper'

describe Litmus::Test do
  describe ".show" do
    it "should give back the test object" do
      test = Litmus::Test.show(1716450)
      test["id"].should == 1716450
    end
  end

  describe ".rename" do
    it "should respond with the new name" do
      test = Litmus::Test.rename(1716450, 'New name')
      test['name'].should == 'New name'
    end
  end

  describe ".destroy" do
    it "should send a delete request for the given id" do
      response = Litmus::Test.destroy(1716450)
      FakeWeb.last_request.method.should eql 'DELETE'
    end
  end
end
