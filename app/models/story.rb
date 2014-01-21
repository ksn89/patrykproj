class Story < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  validates :status, inclusion: {in: %w(Unstarted Started Finished Delivered Accepted Rejected)}
  belongs_to :project
  has_many :comments, :order => 'id DESC'
  has_many :tasks, :order => 'id DESC'
  attr_accessible :project_id, :name, :status, :owner, :story_type, :description, :select
  validates :project_id, :name, :status, :owner, :story_type, :description, :select, presence: true


end
