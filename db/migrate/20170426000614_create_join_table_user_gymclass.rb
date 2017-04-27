class CreateJoinTableUserGymclass < ActiveRecord::Migration
  def change
    create_join_table :Users, :Gymclasses do |t|
      # t.index [:user_id, :gymclass_id]
      # t.index [:gymclass_id, :user_id]
    end
  end
end
