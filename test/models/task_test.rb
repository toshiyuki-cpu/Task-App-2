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
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
