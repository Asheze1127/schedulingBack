class CreateShares < ActiveRecord::Migration[7.1]
  def change
    create_table :shares do |t|
      t.string :title
      t.timestamps
    end
  end
end
