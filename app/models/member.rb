class Member < ActiveRecord::Base

  attr_accessible :project_id, :member_name, :email_member, :project_owner, :confirmed
  validates_presence_of :member_name, :email_member, :project_id
  validates :project_owner, :inclusion => {:in => [true, false]}
  belongs_to :project

  before_create :generate_token

  def activate!(current_user)

    if current_user && current_user.email.downcase == email_member.downcase
      update_attribute(:confirmed, true)
    else
      raise "Invalid user"
    end
  end

  private


  def generate_token
    self.confirmation_token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

end

