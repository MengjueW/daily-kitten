require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "should save link" do
    link = Link.new
    assert link.save
  end
end
