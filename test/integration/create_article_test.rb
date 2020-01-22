require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username:"test", email:"test@test.com", password:"password", admin:true)
  end

  test "create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template "articles/new"
    post articles_path, params:{ article:{ name:"asdasd", description:"asdasddsadas", category_ids: 1}}
    assert_response :success
  end

  test "article name and description invalid" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template "articles/new"
    assert_no_difference "Article.count", 1 do
      post articles_path, params:{ article:{ name:" ", description: " ", category_ids: 1}}
    end
    assert_template "articles/new"
  end

end
