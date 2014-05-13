class AddDoneToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :done, :boolean, default: false
  end
end
