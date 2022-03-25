class CreateJoinTableForActivityCategory < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :activities do |t|
      t.index [:category_id, :activity_id]
      t.index [:activity_id, :category_id]
    end
  end
end
