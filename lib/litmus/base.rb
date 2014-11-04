module Litmus
  class Base
    include HTTParty

    # debug_output $stderr
    def initialize(company, username, password, ssl = false)
      self.class.configure(company, username, password, ssl)
    end

    def self.configure(company, username, password, ssl = false)
      protocol = ssl ? 'https' : 'http'
      self.base_uri "#{protocol}://#{company}.litmus.com"
      self.basic_auth(username, password)
    end
  end
end
