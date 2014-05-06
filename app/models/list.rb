class List < ActiveRecord::Base
  validates :description, presence: true
  validates :description, uniqueness: true
  validates :user, presence: true

  has_many :list_items
  belongs_to :user
  accepts_nested_attributes_for :list_items

  after_create :add_default_list_item
  

  def add_default_list_item
    default_item = ListItem.create(content: "Default item")
    self.list_items << default_item
    self.save
  end
end
