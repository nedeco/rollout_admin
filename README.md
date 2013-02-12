# RolloutAdmin

Gem to controll your rollout features via a webinterface. This is the first "not yet clean" version. Please do not use in production environment.

![Image](app/assets/images/rollout_admin/screen.png?raw=true)

## INSTALL

Add rollout_admin to your Gemfile. Then bundle install. Make sure you have rollout installed as well from nedeco git because rollout_admin relies on the IP address extension. This can be found here:

	git@github.com:nedeco/rollout.git
	
Make sure to use the branch "workable".

rollout_admin expects that:

- you have a User model with the attributes "id", "name", "email". 
- Rollout must be initialized and available via $rollout variable.


To mount the engine within your project add the following line to your routes.rb: 

	mount RolloutAdmin::Engine => "/rollout_admin"

You will be asked for a username and password when accessing the page. The default username, password is foo/bar. You can configure them to be anything you like with the intializer options:

	RolloutAdmin.auth_name		= "myuser"
	RolloutAdmin.auth_password	= "secret"

**Special hint when using an API**

It turned out that in one of our own projects we wrapped the users object to be accessed via an API. Within our main application controller the API calls got some additional headers for API Key which where not accessable within the rollout_admin engine. Therefor there is an option RolloutAdmin.user_url you can configure to provide the URL used for getting a users list within the RolloutAdmin interface.

Furthermore if you don't have the fields name and email present in your User Model or if they are named differently. You can override the User Model attributes rollout_admin should use to display user information.

Just define an initializer and paste the following:

	# Rollout Admin configuration
	#
	RolloutAdmin.user_url = "/just/something/boring.json"
	RolloutAdmin.user_name_attribute	= "first_name"
	RolloutAdmin.user_email_attribute	= "email"

## TODO

- make detailed install instructions
- add configuration for authentication
- make ip feature configurable
- make User model dependency more generic
- check for failing Ajax calls

## Credits

Thanks to jamesgolick for providing rollout gem. Great work.