class ChangePlotsToPlotsAmountInCreditSolicitations < ActiveRecord::Migration[6.0]
  def change
    change_table :credit_solicitations do |t|
      t.rename :plots, :plots_amount
    end
  end
end
