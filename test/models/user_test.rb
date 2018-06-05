require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      username: "thuy",
      email: "thuy@email.com",
      password: "baboon",
      password_confirmation: "baboon"
    )
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.username = " "
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = "  "
    assert_not @user.valid?
  end

  test 'username should be unique' do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  # NOTE email need to upcased? also apply to username?
  test 'email/username should be unique' do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  # FIXME validation for min length not working
  # test "username should not be too short" do
  #   @user.username = "x" * 6
  #   puts @user.username
  #   assert_not @user.valid?
  # end

  # test 'password should not be too short' do
  #   @user.password = "x" * 5
  #   assert_not @user.valid?
  # end

  test "username should not be too long" do
    @user.username = "a" * 21
    assert_not @user.valid?
  end

  test "should accept valid email addresses" do
    valid_addressses = %w[user@email.com USER1@email.here.com 1234_User@this.net last.first@baz.jp here+there@beatles.uk]
    valid_addressses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "should reject invalid email addresses" do
    invalid_addressses = %w[comma@email,com not_at_book.net dash@-example.com underscore@fizz_buzz.com ampersand@amper+sand.com tooMany@dots..com]
    invalid_addressses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

end
