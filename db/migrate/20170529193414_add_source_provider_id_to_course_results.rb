class AddSourceProviderIdToCourseResults < ActiveRecord::Migration[5.1]
  def change
    add_column :course_results, :source_provider_id, :integer
  end
end
