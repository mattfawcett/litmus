module Litmus
  class Base
    include HTTParty

    def initialize(company, username, password)
      self.class.base_uri "#{company}.litmus.com"
      self.class.basic_auth(username, password)
    end
  end
end