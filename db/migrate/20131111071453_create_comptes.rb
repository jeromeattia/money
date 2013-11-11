class CreateComptes < ActiveRecord::Migration
  def change
    create_table :comptes do |t|
      t.date :mois
      t.string :nom
      t.decimal :valeur

      t.timestamps
    end
  end
end
