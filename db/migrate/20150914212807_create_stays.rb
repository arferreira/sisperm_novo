class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
