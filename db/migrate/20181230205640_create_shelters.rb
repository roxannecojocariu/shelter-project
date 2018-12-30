class CreateShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :address, null: false
      t.string :phone_number
      t.string :email
    end
  end
end
