class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.belongs_to :name_list, null: false, foreign_key: true
      t.string :name, limit: 50, null: false
      t.boolean :crossed_out, default: false, null: false
      t.timestamps
      t.index [:name_list_id, :name], unique: true
    end
  end
end
