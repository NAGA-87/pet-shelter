class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :animal_name,           null: false
      t.string :current_location, null: false
      t.string :animal_age,      null: false
      t.string :type,             null: false
      t.integer :male_female_id,  null: false
      t.integer :vaccine_id,      null: false
      t.text :background,         null: false
      t.string :personality,      null: false
      t.string :health,           null: false
      t.string :transfer_method,  null: false
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
