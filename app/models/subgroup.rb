class Subgroup < ActiveRecord::Base
	belongs_to :course
	has_many :assignments
end
