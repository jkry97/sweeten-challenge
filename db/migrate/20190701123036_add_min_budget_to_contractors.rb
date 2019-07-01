class AddMinBudgetToContractors < ActiveRecord::Migration[5.2]
  def change
    add_column :contractors, :min_budget, :decimal, default: 0
  end
end
