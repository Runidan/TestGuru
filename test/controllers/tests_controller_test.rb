# frozen_string_literal: true

require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get tests_new_url
    assert_response :success
  end

  test 'should get create' do
    get tests_create_url
    assert_response :success
  end

  test 'should get edit' do
    get tests_edit_url
    assert_response :success
  end

  test 'should get update' do
    get tests_update_url
    assert_response :success
  end

  test 'should get delete' do
    get tests_delete_url
    assert_response :success
  end
end
