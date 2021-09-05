class Comptabilite < ApplicationRecord
  belongs_to :ipm, optional: true
  validates_presence_of :nom, :prenom, :acte, :payment, :montant, :telephone, :ipm_id

  
  def self.bilan_journalier(select_date)
    @selected_date = select_date
# This will look for records on the given date between 00:00:00 and 23:59:59
    @caiss_journaliers = Comptabilite.where(:created_at => @selected_date.beginning_of_day..@selected_date.end_of_day)
  end
  
  def self.bilan_mensuel(select_date)
    @selected_date = select_date
    @caiss_journaliers = Comptabilite.where(:created_at => @selected_date.beginning_of_month..@selected_date.end_of_month)
  end


  def self.recherche_caiss_journalier(select_date)
    @selected_date = select_date
# This will look for records on the given date between 00:00:00 and 23:59:59
    @caiss_journaliers = Comptabilite.where(:created_at => @selected_date.beginning_of_day..@selected_date.end_of_day)
  end
end