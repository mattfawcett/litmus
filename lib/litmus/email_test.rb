module Litmus
  class EmailTest < Test
    def self.list
      super.reject{|test| test["service"] != 'email'}
    end

    def self.create
      builder = Builder::XmlMarkup.new
      builder.instruct! :xml, :version=>"1.0"
      builder.test_set do |test_set|
        test_set.use_defaults true
        test_set.save_defaults false
      end
      post('/emails.xml', :body => builder.target!, :headers => {"Content-type" => "application/xml"})["test_set"]
    end
  end
end
