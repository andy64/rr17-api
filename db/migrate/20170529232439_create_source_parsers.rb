class CreateSourceParsers < ActiveRecord::Migration[5.1]
  def change
    create_table :source_parsers do |t|
      t.string :parser_name
      t.pattern :url

      t.timestamps
    end
  end
end
