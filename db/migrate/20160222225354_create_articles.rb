class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title # on ajoute un titre : Titre

    end
  end
end