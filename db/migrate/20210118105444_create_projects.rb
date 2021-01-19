class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :created_by
      t.string :email
      t.string :category
      t.string :description
      t.integer :budget
      t.date :published_at

      t.timestamps
    end
  end
end
