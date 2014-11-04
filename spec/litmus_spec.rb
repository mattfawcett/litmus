require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Litmus" do

  describe ".configure" do
    it "should use the appropriate protocol for the given account" do
      Litmus::Base.configure('host', 'user', 'password')
      Litmus::Base.base_uri.should == 'http://host.litmus.com'
      Litmus::Base.configure('host', 'user', 'password', true)
      Litmus::Base.base_uri.should == 'https://host.litmus.com'
    end
  end

end
