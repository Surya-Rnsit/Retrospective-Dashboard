class AddLikesToWhatWentWrongs < ActiveRecord::Migration[5.2]
  def change
    add_column :what_went_wrongs, :likes, :integer, default: 0
  end
end
