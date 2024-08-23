class CreateUserProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_projects do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :progress
      t.json :options

      t.timestamps
    end
  end
end
