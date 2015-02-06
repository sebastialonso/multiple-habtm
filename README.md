# multiple-habtm
A small example on Rails for multiple HABTM association with the same model

There's 3 models:
* Fence
* Channel
* Segmentation

Segmentation is the main model for the association, a single segmentation instace:

`has_many :fences`

`has_many :channels`

And in addition,

`has_many :ages`

Notice how `ages` is a phantom resource, there's no model Age, is just an alias for another association with Channel.

##Example

We will add the collection field `popplers` to Segmentation.

###Join Table
As every HABTM, you need a join table
~~~
class PopplersSegmentationsJoinTable < ActiveRecord::Migration
  def change
    create_table :popplers_segmentations, id: false do |t|
      t.integer :poppler_id
      t.integer :segmentation_id
    end
  end
end
~~~

The name of the join table is extremely important. Check [here](http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_and_belongs_to_many) for more information.

###Models

No model for poppler! Instead do this
~~~
#app/models/segmentation.rb
class Segmentation < ActiveRecord::Base
  has_and_belongs_to_many :popplers, class_name: 'Channel', join_table: 'ages_segmentations', association_foreign_key: 'age_id'
end

#app/models/channel.rb
class Channel < ActiveRecord::Base
  has_and_belongs_to_many :segmentations
end
~~~

