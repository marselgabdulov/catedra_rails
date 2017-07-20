class CreateClerics < ActiveRecord::Migration[5.1]
  def change
    create_table :clerics do |t|
      t.string :name
      t.string :position
      t.string :image

      t.timestamps
    end
  end
end
