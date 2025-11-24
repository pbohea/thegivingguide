class CreateJoinTableGiftGuidesProducts < ActiveRecord::Migration[8.0]
  def change
    create_join_table :gift_guides, :products do |t|
      # t.index [:gift_guide_id, :product_id]
      # t.index [:product_id, :gift_guide_id]
    end
  end
end
