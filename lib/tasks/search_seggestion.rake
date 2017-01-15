namespace :search_seggestions do
  desc "Generate search seggestion for Puducts"
  task index: :environment do
    SearchSeggestion.index_products
  end
end