class CreateCourseResults < ActiveRecord::Migration[5.1]
  def change
    create_table :course_results do |t|
      t.decimal :usd, precision:8, scale: 2
      t.decimal :eur, precision:8, scale: 2
      t.decimal :rur, precision:8, scale: 2

      t.timestamp :created_at, default: Time.now
    end
  end
end
