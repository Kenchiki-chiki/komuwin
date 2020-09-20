class CreateCorrections < ActiveRecord::Migration[6.0]
  def change
    create_table :corrections do |t|
      t.references :document, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
