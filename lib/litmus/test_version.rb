module Litmus
  class TestVersion < Base
    def self.show(test_id, id)
      get("/tests/#{test_id}/versions/#{id}.xml")["test_set_version"]
    end

    def self.list(test_id)
      get("/tests/#{test_id}/versions.xml")["test_set_versions"]
    end

    def self.create(test_id)
      post("/tests/#{test_id}/versions.xml")["test_set_version"]
    end

    def self.poll(test_id, id)
      get("/tests/#{test_id}/versions/#{id}/poll.xml")["test_set_version"]
    end
  end
end