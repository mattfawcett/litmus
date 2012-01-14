require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Litmus" do

  describe ".initialize" do
    it "should use the appropriate protocol for the given account" do
      test = Litmus::Base.new('host', 'user', 'password')
      test.class.base_uri.should == 'http://host.litmus.com'
      test_ssl = Litmus::Base.new('host', 'user', 'password', true)
      test_ssl.class.base_uri.should == 'https://host.litmus.com'
    end
  end
  
end
