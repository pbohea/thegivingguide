class CreateRecipients < ActiveRecord::Migration[8.0]
  def change
    create_table :recipients do |t|
      t.string :age_group
      t.string :sex
      t.text :interests
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
