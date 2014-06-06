class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.references :user, index: true
      t.text :password
      t.text :email

      t.timestamps
    end
  end
end
