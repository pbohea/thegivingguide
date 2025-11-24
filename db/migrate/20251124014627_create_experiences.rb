class CreateExperiences < ActiveRecord::Migration[8.0]
  def change
    create_table :experiences do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :product, null: true, foreign_key: true
      t.references :gift_guide, null: true, foreign_key: true

      t.timestamps
    end
  end
end
