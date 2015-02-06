class AddSegmentationsAgesJoinTable < ActiveRecord::Migration
  def change
    create_table :ages_segmentations, id: false do |t|
      t.integer :age_id
      t.integer :segmentation_id
    end
  end
end
