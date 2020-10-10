class Task < ApplicationRecord
  # 取得した値に対して、条件を指定して並び替えることができる機能
  default_scope -> { order(created_at: :desc) }
  
  belongs_to :user
end
