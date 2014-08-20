RSpec::Matchers.define :require_login do |attribute|
  match {expect(attribute).to redirect_to Rails.application.routes.url_helpers.login_path}
  failure_message_for_should {|actual| 'expected to require login to the access method'}
  failure_message_for_should_not {|actual| 'expected not to require login the access method'}
  description do
    'require login'
  end
end