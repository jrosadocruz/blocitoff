class Task < ActiveRecord::Base
  belongs_to :user
  validates :title , presence: true
  validates :user  , presence: true

  def task_overdue?
    "overdue" if due_date && self.due_date.to_date < DateTime.now.to_date
  end

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end

  def archive!
    self.archived = true
    self.save
  end

  def unarchive!
    self.archived = false
    self.save
  end

end
