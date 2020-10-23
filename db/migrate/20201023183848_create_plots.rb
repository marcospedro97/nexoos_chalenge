class CreatePlots < ActiveRecord::Migration[6.0]
  def change
    create_table :plots do |t|
      t.references :credit_solicitation, null: false, foreign_key: true
      t.date :payment_day
      t.decimal :value

      t.timestamps
    end
  end
end
