class RemUserIdFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :pictures, :users
    remove_reference :pictures, :user,index: true
  end
end
