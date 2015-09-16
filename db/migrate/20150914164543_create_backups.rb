class CreateBackups < ActiveRecord::Migration
  def change
    create_table :backups do |t|
      t.references :server, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
