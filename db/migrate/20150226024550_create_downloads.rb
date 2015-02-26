class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :name
      t.string :filename
      t.string :type
      t.text :description
      t.integer :hits

      t.timestamps null: false
    end
    add_index :downloads, :filename, unique: true
    add_index :downloads, :hits
  end
end
