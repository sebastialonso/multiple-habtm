class Segmentation < ActiveRecord::Base
  has_and_belongs_to_many :fences
  has_and_belongs_to_many :ages, class_name: 'Channel', join_table: 'ages_segmentations', association_foreign_key: 'age_id'
  #Do something alike for Gender
  has_and_belongs_to_many :channels
end
