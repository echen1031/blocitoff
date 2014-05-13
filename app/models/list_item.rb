class ListItem < ActiveRecord::Base
  TIME_TO_LIVE= 7.days
  belongs_to :list
  validates :content, presence: true
  validates :content, uniqueness: { scope: :list_id }

  attr_accessor :done

  def deleted?
    created_at < TIME_TO_LIVE.ago
  end


end
