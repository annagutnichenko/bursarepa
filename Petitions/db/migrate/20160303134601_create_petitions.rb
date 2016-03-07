class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :description
      t.text :content
      t.timestamps null: false
    end
  end
end
