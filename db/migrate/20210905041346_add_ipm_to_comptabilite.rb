class AddIpmToComptabilite < ActiveRecord::Migration[5.2]
  def change
    add_reference :comptabilites, :ipm, foreign_key: true
  end
end
