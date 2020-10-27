class CreatePlotTaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :plot_taxes do |t|
      t.integer :plot
      t.float :tax

      t.timestamps
    end
  end
end
