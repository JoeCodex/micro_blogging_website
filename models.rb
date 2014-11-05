class user < ActiveRecord::Base
	has_many :posts
end

class post < ActiveRecord::Base
	belongs_to :users
end

class profile < ActiveRecord::Base
	
end