class ListItem < ActiveRecord::Base
  DELETION_PERIOD = 7.days
  
  belongs_to :list
  validates :content, presence: true
  validates :content, uniqueness: { scope: :content }
  validates :list, presence: true

  def deleted?
    created_at < DELETION_PERIOD.ago
  end
end
