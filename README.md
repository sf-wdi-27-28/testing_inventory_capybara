# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Testing Inventory

**Objective:** Write feature specs for this app.

## Getting Started

1. Fork this repo, and clone it into your `devel` folder on your local machine.
2. Run `bundle install` to install gems.
3. Run `rake db:create db:migrate` to create and migrate the database.
4. Run `rspec spec/features` in the Terminal. Things should be passing.
5. Take some time to read through the feature specs in `spec/features`.  Also start the server and explore the views.

## Write feature specs

* Start by identifying what should be tested.  Can you think of user stories for some of the features of this app?
* Create feature specs for the untested features of `Products`.  
  * Delete is untested.
  * Should we test the show page?  
* Create specs for `Items`.  Make sure you handle all the major user-flows here too.
* Add a confirmation prompt for delete.  
  * Figure out how to handle the prompt in your feature specs.

### Bonus

* Make sure your tests work in both firefox and chrome.
* Add authentication to the app, prevent new, edit, & deletion of Products and Items.
  * Update your specs for this.  

## Using chrome

If you'd like to use chrome instead of firefox, read-on:

1. Install chromedriver - on OSX try `brew install chromedriver`
2. Set the TEST_BROWSER=chrome environment variable.  Example: `$ TEST_BROWSER=chrome rspec spec/features`
