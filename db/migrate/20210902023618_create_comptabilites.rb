class CreateComptabilites < ActiveRecord::Migration[5.2]
  def change
    create_table :comptabilites do |t|
      t.string :nom
      t.string :prenom
      t.string :acte
      t.string :payment
      t.integer :montant
      t.string :telephone

      t.timestamps
    end
  end
end
