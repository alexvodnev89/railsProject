class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :messagebody

      t.timestamps null: false
    end
  end
end
