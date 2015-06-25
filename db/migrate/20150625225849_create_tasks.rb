class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string      :title
      t.references  :user, index: true, foreign_key: true
      t.datetime    :completed_at
      t.date        :due_date
      t.boolean     :archived, default: false

      t.timestamps null: false
    end
  end
end
