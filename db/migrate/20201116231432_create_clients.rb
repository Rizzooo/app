class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.integer :height
      t.integer :weight
      t.text :goals

      t.timestamps
    end
  end
end
