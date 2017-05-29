class AddUserIdToSourceProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :source_providers, :user_id, :integer, null: false
  end
end
