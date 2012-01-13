module Litmus
  class Base
    include HTTParty
    
    debug_output $stderr
    
    def initialize(company, username, password, ssl = false)
      protocol = ssl ? 'https' : 'http'
      self.class.base_uri "#{protocol}://#{company}.litmus.com"
      self.class.basic_auth(username, password)
    end
  end
end