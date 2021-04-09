class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :place, null: false
      t.string :time, null: false
      t.text :more, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
