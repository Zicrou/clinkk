json.extract! comptabilite, :id, :nom, :prenom, :acte, :payment, :montant, :telephone, :created_at, :updated_at
json.url comptabilite_url(comptabilite, format: :json)
