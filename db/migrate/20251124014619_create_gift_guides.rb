class CreateGiftGuides < ActiveRecord::Migration[8.0]
  def change
    create_table :gift_guides do |t|
      t.string :name
      t.text :description
      t.references :occasion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
