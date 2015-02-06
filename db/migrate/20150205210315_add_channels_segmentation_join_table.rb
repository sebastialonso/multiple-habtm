class AddChannelsSegmentationJoinTable < ActiveRecord::Migration
  def change
    create_table :channels_segmentations, id: false do |t|
      t.integer :channel_id
      t.integer :segmentation_id
    end
  end
end
