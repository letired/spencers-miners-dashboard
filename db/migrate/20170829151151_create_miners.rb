class CreateMiners < ActiveRecord::Migration[5.1]
  def change
    create_table :miners do |t|
      t.string :address
      t.string :name
      t.integer :api, default: 0

      t.timestamps
    end
  end
end
