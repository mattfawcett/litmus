require 'spec_helper'

describe Litmus::EmailTest do
  describe ".list" do
    it "should give me a list of email test objects" do
      list = Litmus::EmailTest.list
      list.length.should eql(1)
      list.first["name"].should eql("A really good email")
      list.first["id"].should eql(1715760)
    end
  end

  describe ".create" do
    it "should give me back a new email object" do
      email_test = Litmus::EmailTest.create
      email_test["test_set_versions"].first["version"].should == 1
      email_test["test_set_versions"].first["url_or_guid"].should =~ /@emailtests\.com/
      email_test["id"].should be_a(Integer)
    end
  end

  describe ".find_by_name" do
    it "should return only the test object with the correct name" do
      really_good = Litmus::EmailTest.find_by_name('A really good email')
      really_good["name"].should eql('A really good email')
    end
  end
end
