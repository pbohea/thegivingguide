class CreateConsultationRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :consultation_requests do |t|
      t.string :name
      t.string :email
      t.text :message
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
