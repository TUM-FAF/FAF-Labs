class Course < ActiveRecord::Base
	has_many :subgroups
end
