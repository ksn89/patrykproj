class Comment < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :body
  belongs_to :story, :counter_cache => true
  belongs_to :user
  validates_presence_of :body
  validates_length_of :body, maximum: 128

end
