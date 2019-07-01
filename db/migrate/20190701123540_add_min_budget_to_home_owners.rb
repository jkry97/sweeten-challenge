class AddMinBudgetToHomeOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :home_owners, :min_budget, :decimal, default: 0
  end
end
