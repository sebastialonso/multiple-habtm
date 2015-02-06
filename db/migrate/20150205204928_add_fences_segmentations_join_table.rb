class AddFencesSegmentationsJoinTable < ActiveRecord::Migration
  def change
    create_table :fences_segmentations, id: false do |t|
      t.integer :fence_id
      t.integer :segmentation_id
    end
  end
end