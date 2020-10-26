class CreateCreditSolicitations < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_solicitations do |t|
      t.references :applicant, null: false, foreign_key: true
      t.decimal :value
      t.integer :plots_amount
      t.float :interest_rate
      t.references :plot_tax, null: false, foreign_key: true
      t.decimal :value_with_rate
      t.decimal :plots_value

      t.timestamps
    end
  end
end
