module Litmus
  class Result < Base
    def self.list(test_id, version_id)
      get("/tests/#{test_id}/versions/#{version_id}/results.xml")["results"]
    end

    def self.show(test_id, version_id, id)
      get("/tests/#{test_id}/versions/#{version_id}/results/#{id}.xml")["result"]
    end
  end
end