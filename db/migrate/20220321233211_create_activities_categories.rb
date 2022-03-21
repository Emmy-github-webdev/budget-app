class CreateActivitiesCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :activities_categories do |t|
      t.references :activities, null: false, foreign_key: true
      t.references :categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end
