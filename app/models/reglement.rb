class Reglement < ApplicationRecord
  belongs_to :ipm
  belongs_to :comptabilite, optional: :true

  validates_presence_of :ipm_id, :montant

  def self.bilan_mensuel(select_date)
    @selected_date = select_date
    @caiss_mensuel = Reglement.where(:created_at => @selected_date.beginning_of_month..@selected_date.end_of_month)
  end
end
