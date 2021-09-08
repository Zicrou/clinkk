class AddMontantTotalToComptabilite < ActiveRecord::Migration[5.2]
  def change
    add_column :comptabilites, :montant_total, :integer
  end
end
