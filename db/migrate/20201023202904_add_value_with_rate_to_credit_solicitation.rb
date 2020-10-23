class AddValueWithRateToCreditSolicitation < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_solicitations, :value_with_rate, :decimal
  end
end
