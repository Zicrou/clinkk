class AddPourcentageIpmAndMontantIpmToComptabilite < ActiveRecord::Migration[5.2]
  def change
    add_column :comptabilites, :pourcentage_ipm, :integer
  end
end
