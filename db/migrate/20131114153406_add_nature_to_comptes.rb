class AddNatureToComptes < ActiveRecord::Migration
  def change
    add_column :comptes, :nature, :string
  end
end
