require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "fails because no password" do
    assert  !User.new({last_name: 'Mylast1', first_name: 'Andrei', email: 'admin@email.com', password: nil  }).save
  end
  test "fails short password" do
    assert !User.new({last_name: 'Mylast1', first_name: 'Andrei', email: 'admin@email.com', password: 'one'  }).save
  end
end
