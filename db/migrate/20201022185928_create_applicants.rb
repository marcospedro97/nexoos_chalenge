class CreateApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :applicants do |t|
      t.string :social_name
      t.string :cnpj
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
