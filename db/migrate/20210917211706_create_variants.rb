class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.string :precio
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
