class AddLikesToImprovements < ActiveRecord::Migration[5.2]
  def change
    add_column :improvements, :likes, :integer, default: 0
  end
end
