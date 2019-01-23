class AddEmailAndPhoneToTerrorists < ActiveRecord::Migration[5.2]
  def change
    add_column :terrorists, :email, :string
    add_column :terrorists, :phone, :string
  end
end
