class RemoveProdCompanyAndLang < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :production_companies
    remove_column :movies, :production_countries
    remove_column :movies, :spoken_languages


  end
end
