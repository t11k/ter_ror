class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :kind
      t.string :serial_number

      t.timestamps
    end
  end
end
