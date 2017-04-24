class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :memtype
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
    add_index :memberships, [:user_id, :created_at]
  end
end
