require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one_user)
    @comment = comments(:one_comment)
    @comment.user = @user
    @link = links(:one_link)
    @link.comments << @comment
    sign_in @user          # sign_in(resource)
  end

  #test "should show comment" do
  #  get :show, id: @comment
  #  assert_response :success
  #end

  #test "should create comment" do
  #  assert_difference('Comment.count') do
  #    post :create, comment: { body: @comment.body }, link_id: @link.id
  #  end

  #  assert_redirected_to link_path(assigns(:link))
  #end

end
