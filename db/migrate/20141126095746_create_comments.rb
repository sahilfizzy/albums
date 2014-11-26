class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :photo, index: true

      t.timestamps
    end
  end
end
