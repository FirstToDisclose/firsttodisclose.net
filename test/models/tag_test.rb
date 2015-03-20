require 'test_helper'

class TagTest < ActiveSupport::TestCase

  test "Should not save tag without name" do
    tag = Tag.new
    assert_not tag.save
  end

  test "Should save valid tag" do
    tag = Tag.create(name: "Invention")
    assert tag.save
  end
end
