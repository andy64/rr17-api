class AddActiveToSourceProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :source_providers, :active, :bool, default: true
  end
  def up
    SourceProvider.all.each do |item|
      item.active = true
      item.save
    end
  end
end
