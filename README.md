# blacklight-tutorial-app
Rails app with commits for the [Project Blacklight tutorial](https://workshop.projectblacklight.org/)

Ruby 3.3.0

Setup:
```
gem install solr_wrapper
```

To run the server, first make sure the Solr server is running. It is slow to start up.
```
bundle exec solr_wrapper
```
Add test data
```
rake solr:marc:index_test_data
```
Start the rails server
```
rails server
```

Instructions taken from [ProjectBlacklight Quickstart](https://github.com/projectblacklight/blacklight/wiki/Quickstart). See that page for more details.