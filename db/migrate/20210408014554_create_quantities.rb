class CreateQuantities < ActiveRecord::Migration[6.1]
  def change
    create_table :quantities do |t|

      t.timestamps
    end
  end
end
