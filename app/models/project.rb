class Project < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  has_many :members,->{order(member_name: :asc)}, :dependent => :destroy
  has_many :stories, :dependent => :destroy

  after_create :create_member
  attr_accessible :name, :user_name
  attr_accessor :current_user_email
  validates :name, :user_name, presence: true
  validates :name, uniqueness: true
  validates_length_of :name, maximum: 15
  default_scope ->{ order(updated_at: :desc) }

  def create_member
    Member.create!(member_name: current_user_email, email_member: current_user_email, project_id: id, project_owner: true, confirmed: true)
  end

end
