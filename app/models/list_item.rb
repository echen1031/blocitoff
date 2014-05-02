class ListItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  validates :content, presence: true
  validates :content, uniqueness: { scope: :content }
  validates :list_id, presence: true
  validates :user, presence: true
end
