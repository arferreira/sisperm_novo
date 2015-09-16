class CreateScales < ActiveRecord::Migration
  def change
    create_table :scales do |t|
      t.references :stay, index: true, foreign_key: true
      t.date :day_scale
      t.date :month_scale
      t.date :year_scale
      t.boolean :status

      t.timestamps null: false
    end
  end
end
