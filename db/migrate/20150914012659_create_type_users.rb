class CreateTypeUsers < ActiveRecord::Migration
  def change
    create_table :type_users do |t|
      t.integer :type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
