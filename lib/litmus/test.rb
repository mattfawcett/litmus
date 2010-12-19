module Litmus
  class Test < Base
    def self.list
      get('/tests.xml')["test_sets"]
    end

    def self.show(id)
      get("/tests/#{id}.xml")["test_set"]
    end
  end
end