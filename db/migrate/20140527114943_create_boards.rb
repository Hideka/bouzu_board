class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.text :intro
      t.references :user, index: true

      t.timestamps
    end
  end
end
