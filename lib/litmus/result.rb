module Litmus
  class Result < Base
    def self.list(test_id, version_id)
      get("/tests/#{test_id}/versions/#{version_id}/results.xml")["results"]
    end

    def self.show(test_id, version_id, id)
      get("/tests/#{test_id}/versions/#{version_id}/results/#{id}.xml")["result"]
    end

    def self.update(test_id, version_id, id, new_state)
      builder = Builder::XmlMarkup.new
      builder.instruct! :xml, :version=>"1.0"
      builder.result do |result|
        result.check_state new_state
      end
      put("/tests/#{test_id}/versions/#{version_id}/results/#{id}.xml")["result"]
    end

    def self.retest(test_id, version_id, id)
      post("/tests/#{test_id}/versions/#{version_id}/results/#{id}/retest.xml")
    end
  end
end
