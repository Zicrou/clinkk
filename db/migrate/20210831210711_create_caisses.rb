class CreateCaisses < ActiveRecord::Migration[5.2]
  def change
    create_table :caisses do |t|
      t.string :nom
      t.string :prenom
      t.string :acte
      t.string :payement
      t.integer :montant
      t.string :telephone

      t.timestamps
    end
  end
end
