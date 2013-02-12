require "rollout_admin/engine"

module RolloutAdmin
    mattr_accessor :user_url

    mattr_accessor :user_name_attribute
    @@user_name_attribute = "Name"

    mattr_accessor :user_email_attribute
	@@user_email_attribute = "email"    

	mattr_accessor :auth_name
	@@auth_name = "foo"

	mattr_accessor :auth_password
	@@auth_password = "bar"
end
