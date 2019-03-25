class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, foreign_key: true,index: true
      t.references :user, foreign_key: true,index: true
      t.boolean :read,null: false, default: false

      t.timestamps
    end
  end
end
