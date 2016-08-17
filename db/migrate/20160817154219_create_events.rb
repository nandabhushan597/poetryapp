class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :time
      t.text :details

      t.timestamps
    end
  end
end
