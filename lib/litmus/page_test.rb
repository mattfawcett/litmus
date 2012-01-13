module Litmus
  class PageTest < Test
    def self.list
      super.reject{|test| test["service"] != 'page'}
    end

    def self.create(url, name = nil, sandbox = false)
      builder = Builder::XmlMarkup.new
      builder.instruct! :xml, :version=>"1.0"
      builder.test_set do |test_set|
        test_set.use_defaults true
        test_set.url url
        test_set.name name if name
        test_set.sandbox true if sandbox
      end
      post('/pages.xml', :body => builder.target!, :headers => {"Content-type" => "application/xml"})["test_set"]
    end
  end
end
