module Litmus
  class Report < Base
    def self.list
      get("/reports.xml")["reports"]
    end

    def self.show(report_id)
      get("/reports/#{report_id}.xml")["report"]
    end

    def self.create(name)
      builder = Builder::XmlMarkup.new
      builder.instruct! :xml, :version=>"1.0"
      builder.report do |report|
        report.name name if name
      end
      post('/reports.xml', :body => builder.target!, :headers => {"Content-type" => "application/xml"})["report"]
    end
  end
end
