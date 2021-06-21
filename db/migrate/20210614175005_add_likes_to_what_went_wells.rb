class AddLikesToWhatWentWells < ActiveRecord::Migration[5.2]
  def change
    add_column :what_went_wells, :likes, :integer,default: 0
  end
end
