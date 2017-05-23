class CreateSourceProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :source_providers do |t|
      t.string :name, unique: true, null: false
      t.string :url, unique: true, null: false
      t.string :address, null: false
      t.timestamp :last_sync_at
      t.timestamps

    end
    add_index :source_providers, :name
    add_index :source_providers, :url
  end
end
