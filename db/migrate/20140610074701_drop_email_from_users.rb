class DropEmailFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :email
  end

  def self.down
    add_column :users, :email, :text
  end
end
