module Litmus
  class Test < Base
    def self.list
      get('/tests.xml')["test_sets"]
    end

    def self.show(id)
      get("/tests/#{id}.xml")["test_set"]
    end

    def self.rename(id, new_name)
      builder = Builder::XmlMarkup.new
      builder.instruct! :xml, :version=>"1.0"
      builder.test_set do |test_set|
        test_set.name new_name
      end
      put("/tests/#{id}.xml", :body => builder.target!, :headers => {"Content-type" => "application/xml"})["test_set"]
    end

    def self.find_by_name(name)
      self.list.keep_if { |t| t['name'] == name }.first
    end

    def self.destroy(id)
      delete("/tests/#{id}.xml")
    end
  end
end
