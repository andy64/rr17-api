class ChangeCurrencyColumnInCourseResults < ActiveRecord::Migration[5.1]
  def up
    change_table :course_results do |t|
      t.change :usd, :decimal, {precision:8, scale: 4}
      t.change :eur, :decimal, {precision:8, scale: 4}
      t.change :rur, :decimal, {precision:8, scale: 4}
    end
  end
  def down
    change_table :course_results do |t|
      t.change :usd, :decimal, {precision:8, scale: 2}
      t.change :eur, :decimal, {precision:8, scale: 2}
      t.change :rur, :decimal, {precision:8, scale: 2}
    end
  end
end
