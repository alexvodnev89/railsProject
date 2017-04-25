class CreateMembershipOptions < ActiveRecord::Migration
  def change
    create_table :membership_options do |t|
      t.string :title
      t.string :description
      t.string :price

      t.timestamps null: false
    end
  end
end
