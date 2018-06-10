class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.integer :index
      t.integer :value

      t.timestamps
    end
  end
end
