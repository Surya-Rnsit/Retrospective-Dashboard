class CreateActionitems < ActiveRecord::Migration[5.2]
  def change
    create_table :actionitems do |t|
      t.text :body
      t.boolean :ischeck , default: false

      t.timestamps
    end
  end
end
