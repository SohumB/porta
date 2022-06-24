# frozen_string_literal: true

require 'test_helper'

module CMS

  class BuiltinStaticPageTest < ActionDispatch::IntegrationTest
    def setup
      @provider = FactoryBot.create(:provider_account)
      host! @provider.domain
    end

    test 'builtin static page has default layout' do
      get '/signup'
      assert_template 'layouts/main_layout'
    end
  end

end
