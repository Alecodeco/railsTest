require 'test_helper'

class ArticleControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username:"test", email:"test@test.com", password:"password", admin:true)
  end

  test "should show article" do
    get articles_path
    assert_response :success
  end

  test "should get new only if logged" do
    get new_article_path
    assert_response :redirect
    sign_in_as(@user,"password")
    get new_article_path
    assert_response :success
  end


end
