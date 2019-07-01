class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.decimal :latitude, default: nil
      t.decimal :longitude, default: nil
      t.decimal :max_budget, default: 0
      t.boolean :build_services, default: false
      t.boolean :design_services, default: false
      t.decimal :rating, default: 0

      t.timestamps
    end
  end
end
