class CreateTextfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :textfiles do |t|
      t.belongs_to :result

      t.timestamps
    end
  end
end
