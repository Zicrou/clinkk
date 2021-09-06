class CreateActes < ActiveRecord::Migration[5.2]
  def change
    create_table :actes do |t|
      t.string :name

      t.timestamps
    end
  end
end
