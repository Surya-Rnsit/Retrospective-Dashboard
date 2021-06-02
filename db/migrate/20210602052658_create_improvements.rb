class CreateImprovements < ActiveRecord::Migration[5.2]
  def change
    create_table :improvements do |t|
      t.text :body

      t.timestamps
    end
  end
end
