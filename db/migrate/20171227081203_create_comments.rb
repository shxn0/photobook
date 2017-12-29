class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :wall, index: true, foreign_key: true
      t.text :context

      t.timestamps null: false
    end
  end
end
