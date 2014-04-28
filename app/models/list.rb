class List < ActiveRecord::Base
  validates :description, presence: true
end
