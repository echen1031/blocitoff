class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :lists, :title, :description
  end

  def self.down
  end
end
