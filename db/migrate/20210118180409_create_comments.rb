class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :project, null: false, foreign_key: true
      t.string :description
      t.string :first_name

      t.timestamps
    end
  end
end
