class CreateNameLists < ActiveRecord::Migration[6.0]
  def change
    create_table :name_lists do |t|
      t.string :code, limit: 12, null: false, index: {unique: true}
      t.timestamps
    end
  end
end
