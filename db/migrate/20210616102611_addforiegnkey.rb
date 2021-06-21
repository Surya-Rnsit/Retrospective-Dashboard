class Addforiegnkey < ActiveRecord::Migration[5.2]
  def change
    add_reference :actionitems, :sprint, index: true, foreign_key: true
    add_reference :improvements, :sprint, index: true, foreign_key: true
    add_reference :what_went_wells, :sprint, index: true, foreign_key: true
    add_reference :what_went_wrongs, :sprint, index: true, foreign_key: true
  end
end
