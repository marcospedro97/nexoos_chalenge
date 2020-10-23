class AddPlotsValueToCreditSolicitations < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_solicitations, :plots_value, :decimal
  end
end
