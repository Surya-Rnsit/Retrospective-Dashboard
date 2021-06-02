class CreateWhatWentWells < ActiveRecord::Migration[5.2]
  def change
    create_table :what_went_wells do |t|
      t.text :body

      t.timestamps
    end
  end
end
