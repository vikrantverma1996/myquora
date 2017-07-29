class CreateUpvoters < ActiveRecord::Migration
  def change
    create_table :upvoters do |t|
      t.references :user, index: true, foreign_key: true
      t.references :reply, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
