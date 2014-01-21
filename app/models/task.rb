class Task < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :task_field
  belongs_to :story, :counter_cache => true
  belongs_to :user
  validates_presence_of :task_field
end
