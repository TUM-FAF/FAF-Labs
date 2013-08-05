class Assignment < ActiveRecord::Base
	belongs_to :subgroup
  # scope :published,   -> { where(published: true) }
end
