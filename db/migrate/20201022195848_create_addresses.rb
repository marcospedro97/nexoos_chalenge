class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :complement
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
