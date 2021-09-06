class AddTypePaimentToComptabilite < ActiveRecord::Migration[5.2]
  def change
    add_reference :comptabilites, :type_paiment, foreign_key: true
  end
end
