class Story < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  validates :status, inclusion: {in: %w(Unstarted Started Finished Delivered Accepted Rejected)}
  belongs_to :project
  has_many :comments, -> {order(created_at: :desc)}
  has_many :tasks, -> {order(created_at: :desc)}
  attr_accessible :project_id, :name, :status, :owner, :story_type, :description, :select
  validates :project_id, :name, :status, :owner, :story_type, :description, :select, presence: true
  validates_length_of :name, maximum: 15
  validates :name, uniqueness: {scope: :project_id}
end
