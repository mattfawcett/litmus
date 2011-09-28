require 'spec_helper'

describe Litmus::PageTest do
  describe ".list" do
    it "should give me a list of page test objects" do
      list = Litmus::PageTest.list
      list.length.should eql(1)
      list.first["name"].should eql("Home | Real Ale Hunter")
      list.first["id"].should eql(1715752)
    end
  end

  describe ".create" do
    it "should give me back a new page object" do
      page_test = Litmus::PageTest.create("http://matthewfawcett.co.uk/")
      page_test["id"].should == 1716444
    end
  end

  describe ".find_by_name" do
    it "should return only the test object with the correct name" do
      home = Litmus::PageTest.find_by_name('Home | Real Ale Hunter')
      home["name"].should eql("Home | Real Ale Hunter")
    end
  end
end
