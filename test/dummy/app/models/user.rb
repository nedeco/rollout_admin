class User < ActiveRecord::Base
  attr_accessible :email, :name

  def Name
  	self.name
  end
  
end
