class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :score_tag
      t.integer :confidence
      t.string :agreement
      t.string :subjectivity
      t.string :irony
      t.string :text_excerpt

      t.timestamps
    end
  end
end
