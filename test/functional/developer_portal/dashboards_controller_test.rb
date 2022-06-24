require 'test_helper'

class DeveloperPortal::DashboardsControllerTest < DeveloperPortal::ActionController::TestCase

  def setup
    super
    @provider = FactoryBot.create(:provider_account)
    @buyer = FactoryBot.create(:buyer_account, provider_account: @provider)
    login_buyer(@buyer)
  end

  test 'trial' do
    @plan = FactoryBot.create(:application_plan, service: @provider.first_service!, trial_period_days: 10)
    @app = FactoryBot.create(:cinstance, plan: @plan, user_account: @buyer)

    get :show

    assert_response :success
    assert_select 'h3', text: 'Trial period'
    assert_select 'p', text: '10 days remaining.'
  end

  # TODO: not sure about removing this one
end
