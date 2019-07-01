class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.integer :rating, default: 0
      t.references :home_owner, foreign_key: true
      t.references :contractor, foreign_key: true

      t.timestamps
    end
  end
end
