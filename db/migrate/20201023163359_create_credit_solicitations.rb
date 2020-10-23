class CreateCreditSolicitations < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_solicitations do |t|
      t.references :applicant, null: false, foreign_key: true
      t.decimal :value
      t.integer :plots
      t.float :interest_rate

      t.timestamps
    end
  end
end
