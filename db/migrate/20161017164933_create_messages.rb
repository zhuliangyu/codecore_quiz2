class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :department
      t.text :message
      t.boolean :status

      t.timestamps
    end
  end
end
