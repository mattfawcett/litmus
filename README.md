Litmus
======

A simple wrapper around the Litmus *customer* API using httparty. This does not use the reseller API and should not be used to reset Litmus services. See the [API documentation](http://docs.litmus.com/w/page/18056603/Customer-API-documentation) for details

Currently Implmented
--------------------
* Litmus::EmailTest.list
* Litmus::EmailTest.show(id)
* Litmus::EmailTest.create
* Litmus::PageTest.list
* Litmus::PageTest.show(id)
* Litmus::PageTest.create(url)
* Litmus::TestVersion.list(test_id)
* Litmus::TestVersion.show(test_id, test_version_id)
* Litmus::TestVersion.poll(test_id, test_version_id)
* Litmus::TestVersion.create(test_id)
* Litmus::Result.list(test_id, test_version_id)
* Litmus::Result.show(test_id, test_version_id, result_id)


Example Usage
-------------

    # Setup the authentication details
    Litmus::Base.new("your_company_subdomain", "username", "password")
  
    # Lets create an email test
    email_test = Litmus::EmailTest.create
    send_test_to = email_test["test_set_versions"].first["url_or_guid"] #=> "f1b17db@emailtests.com" 
    test_id = email_test["id"] #=> 1716534
    version = email_test["test_set_versions"].first["version"] #=> 1
  
    # If we query our new version we can see Litmus have not had the email yet
    Litmus::TestVersion.show(test_id, version)["received"] #=> false
  
    # Lets send them the email
    Pony.mail(:to => send_test_to, :from => 'mail@matthewfawcett.co.uk', :subject => 'hi', :body => 'Hello there, this is a test')
  
    # Now they have it
    Litmus::TestVersion.show(test_id, version)["received"] #=> "true"
  
    # Lets poll the results and look at the first client
    Litmus::TestVersion.poll(test_id, version)["results"].first.inspect #=> {"id"=>33539350, "test_code"=>"hotmail", "state"=>"pending"}
  
    # The hotmail test is still pending, lets wait for a while
    sleep 10
  
    # Lets poll the results again and see that its complete
    Litmus::TestVersion.poll(test_id, version).first.inspect #=> {"id"=>33539350, "test_code"=>"hotmail", "state"=>"complete"}
  
    # Now lets show the result for this test version
    image_url = Litmus::Result.show(test_id, version, 33539350)["result_images"].first["full_image"] #=> "s3.amazonaws.com/resultcaptures/2f21fc9c-08f6-4429-b53d-2e224189526b.fullpageon.png"
  
    system("open http://#{image_url}")
    # Looks good!
