$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'litmus'
require 'rspec'
require 'rspec/autorun'

require 'fakeweb'
FakeWeb.allow_net_connect = false

RSpec.configure do |config|
  FakeWeb.register_uri(:get, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests.xml', 
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'all_tests.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:post, 'http://matt:yourpassword@matthewfawcett.litmus.com/emails.xml', 
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'create_email_test.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:post, 'http://matt:yourpassword@matthewfawcett.litmus.com/pages.xml', 
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'create_page_test.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:get, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests/1716450.xml',
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'show_test.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:put, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests/1716450.xml',
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'rename_test.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:get, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests/1716450/versions/1.xml',
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'show_test_version.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:get, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests/1715760/versions.xml',
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'list_test_versions.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:post, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests/1715760/versions.xml',
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'create_test_version.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:get, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests/1715760/versions/1/poll.xml',
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'poll_test_version.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:get, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests/1715760/versions/1/results.xml',
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'list_results.xml'),
                       :content_type => "text/xml")
  FakeWeb.register_uri(:get, 'http://matt:yourpassword@matthewfawcett.litmus.com/tests/1715760/versions/1/results/33524970.xml',
                       :body => File.join(File.dirname(__FILE__), 'fixtures', 'show_result.xml'),
                       :content_type => "text/xml")
  config.before(:each) do
    Litmus::Base.new("matthewfawcett", "matt", "yourpassword")
  end
end
