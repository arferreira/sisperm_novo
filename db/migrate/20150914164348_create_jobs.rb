class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :day_thread
      t.text :alteration

      t.timestamps null: false
    end
  end
end
