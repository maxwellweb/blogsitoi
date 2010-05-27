require File.dirname(__FILE__) + '/test_helper'

class CoreExtTest < ActiveSupport::TestCase
  test "a should be a" do
    assert_equal "a", "à".to_url
    assert_equal "a", "á".to_url
    assert_equal "a", "â".to_url
    assert_equal "a", "ä".to_url
  end

  test "e should be e" do
    assert_equal "e", "è".to_url
    assert_equal "e", "é".to_url
    assert_equal "e", "ê".to_url
    assert_equal "e", "ë".to_url
  end

  test "i should be i" do
    assert_equal "i", "ì".to_url
    assert_equal "i", "í".to_url
    assert_equal "i", "î".to_url
    assert_equal "i", "ï".to_url
  end

  test "o should be o" do
    assert_equal "o", "ò".to_url
    assert_equal "o", "ó".to_url
    assert_equal "o", "ô".to_url
    assert_equal "o", "ö".to_url
  end

  test "u should be u" do
    assert_equal "u", "ù".to_url
    assert_equal "u", "ú".to_url
    assert_equal "u", "û".to_url
    assert_equal "u", "ü".to_url
  end
  
  test "ñ should be n" do
    assert_equal "n", "Ñ".to_url
    assert_equal "n", "ñ".to_url
  end

  test "ç should be c" do
    assert_equal "c", "Ç".to_url
    assert_equal "c", "ç".to_url
  end

  test "anul·lada should be anul-lada" do
    assert_equal "anul-lada", "anul·lada".to_url
  end
  
  test "blank should be -" do
    assert_equal "hello-friend", "hello friend".to_url
  end
  
  test '[hello "friend"] should be [hello-friend]' do
    assert_equal "hello-friend", "hello \"friend\"".to_url
  end
  
  test '[--hello friend--] should be [hello-friend]' do
    assert_equal "hello-friend", "--hello friend--".to_url
  end

  test '[     hello friend  ] should be [hello-friend]' do
    assert_equal "hello-friend", "      hello friend  ".to_url
  end
  
  test '[hello:   \"friend.\"] should be [hello-friend]' do
    assert_equal "hello-friend", "hello:   \"friend.\"".to_url
  end
end