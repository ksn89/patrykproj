class Project < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  has_many :members, :dependent => :destroy, :order => 'member_name ASC'
  has_many :stories, :dependent => :destroy

  after_create :create_member
  attr_accessible :name, :user_name
  attr_accessor :current_user_email
  validate :name, :user, presence: true
  validates :name, :user_name, presence: true
  validates :name, uniqueness: true
  default_scope { order('updated_at DESC') }

  def create_member
    Member.create!(member_name: current_user_email, email_member: current_user_email, project_id: id, project_owner: true, confirmed: true)
  end

end
