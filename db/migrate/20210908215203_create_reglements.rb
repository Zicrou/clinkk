class CreateReglements < ActiveRecord::Migration[5.2]
  def change
    create_table :reglements do |t|
      t.date :mois
      t.integer :montant
      t.references :ipm, foreign_key: true

      t.timestamps
    end
  end
end
