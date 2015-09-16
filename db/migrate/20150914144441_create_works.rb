class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :user, index: true, foreign_key: true
      t.date :day_work
      t.text :alteration

      t.timestamps null: false
    end
  end
end
