class CreateCompletedStories < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_stories do |t|
      t.text :body
      t.timestamps
    end
  end
end
