class ChangeNameDescriptionToProducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :name, :string, :null => false
    change_column :products, :description, :string, :null => false
  end
end
