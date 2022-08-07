class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :sub_title
      t.text :description
      t.string :main_image_file_name
      t.string :thumb_image_file_name

      t.timestamps
    end
  end
end
