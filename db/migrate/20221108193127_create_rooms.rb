class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :description
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
