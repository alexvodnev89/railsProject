class CreateGymclasses < ActiveRecord::Migration
  def change
    create_table :gymclasses do |t|
      t.string :name
      t.string :weekday
      t.string :description

      t.timestamps null: false
    end
  end
end
