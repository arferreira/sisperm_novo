class CreateServiceServers < ActiveRecord::Migration
  def change
    create_table :service_servers do |t|
      t.references :service, index: true, foreign_key: true
      t.references :server, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
