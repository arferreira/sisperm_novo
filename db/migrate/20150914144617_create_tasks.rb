class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :server, index: true, foreign_key: true
      t.boolean :done
      t.belongs_to :work, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
