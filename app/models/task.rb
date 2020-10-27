# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Task < ApplicationRecord
  # 取得した値に対して、条件を指定して並び替えることができる機能
  default_scope -> { order(created_at: :desc) }
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { in: 5..300 }
end
