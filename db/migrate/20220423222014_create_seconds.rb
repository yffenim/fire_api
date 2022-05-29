class CreateSeconds < ActiveRecord::Migration[6.1]
  def change
    create_table :seconds do |t|
      t.string :title
      t.float :level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
