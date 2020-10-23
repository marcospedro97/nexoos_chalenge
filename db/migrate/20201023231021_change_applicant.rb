class ChangeApplicant < ActiveRecord::Migration[6.0]
  def change
    add_index :applicants, :cnpj, unique: true
    add_index :phones, :number, unique: true
  end
end
