class AddSlugToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :slug, :string
  end
end
