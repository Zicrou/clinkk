class AddReglementedToComptabilite < ActiveRecord::Migration[5.2]
  def change
    add_column :comptabilites, :reglemented, :integer
    add_reference :comptabilites, :reglement, foreign_key: true
  end
end
