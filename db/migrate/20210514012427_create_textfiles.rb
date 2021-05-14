class CreateTextfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :textfiles do |t|
      t.string :file_url

      t.timestamps
    end
  end
end
