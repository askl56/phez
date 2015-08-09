require 'rails_helper'

RSpec.describe Api::V1::ProfilesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/api/v1/profiles/1/posts').to('api/v1/profiles#posts', {:username=>"1", :format=>:json}) }
	it { should route(:get, '/api/v1/profiles/1/comments').to('api/v1/profiles#comments', {:username=>"1", :format=>:json}) }
	it { should route(:get, '/api/v1/profiles/1/details').to('api/v1/profiles#show', {:username=>"1", :format=>:json}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:set_xhr_redirected_to) }
	it { should use_before_filter(:set_request_method_cookie) }
	it { should use_before_filter(:configure_permitted_parameters) }
	it { should use_before_filter(:set_cors_headers) }
	it { should use_before_filter(:set_by_username) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
	it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end