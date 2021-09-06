class AddActeToComptabilite < ActiveRecord::Migration[5.2]
  def change
    add_reference :comptabilites, :acte, foreign_key: true
  end
end
