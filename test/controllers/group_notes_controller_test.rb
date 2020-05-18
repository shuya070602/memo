require 'test_helper'

class GroupNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_notes_index_url
    assert_response :success
  end

  test "should get show" do
    get group_notes_show_url
    assert_response :success
  end

  test "should get new" do
    get group_notes_new_url
    assert_response :success
  end

  test "should get create" do
    get group_notes_create_url
    assert_response :success
  end

  test "should get edit" do
    get group_notes_edit_url
    assert_response :success
  end

  test "should get update" do
    get group_notes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get group_notes_destroy_url
    assert_response :success
  end

end
