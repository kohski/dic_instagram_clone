class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :comment
      t.text :image

      mount_uploader :image,ImageUploader

      t.timestamps
    end
  end
end
