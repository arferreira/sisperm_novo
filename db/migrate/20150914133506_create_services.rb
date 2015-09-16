class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :user, index: true, foreign_key: true
      t.references :server, index: true, foreign_key: true
      t.date :date_service
      t.text :obs

      t.timestamps null: false
    end
  end
end
