require 'webmock/rspec'

WebMock.disable_net_connect!(allow: 'codeclimate.com')

module WebMockHelpers
  def self.bitreserve_stub_request(method, url, response = [])
    WebMock::API.stub_request(method, Bitreserve::Request.base_uri + url).
      to_return(body: response.to_json, headers: { 'Content-Type' =>  'application/json' })
  end

  def self.bitreserve_stub_request_with_auth(method, url, response = [], auth = nil)
    new_url = generate_auth_url(url, auth)
    WebMock::API.stub_request(method, new_url).
      to_return(body: response.to_json, headers: { 'Content-Type' =>  'application/json' })
  end

  private

  def self.generate_auth_url(url, auth)
    split_url = Bitreserve::Request.base_uri.split('//')
    split_url[0] + '//' + auth[:username] + ':' + auth[:password] + '@' + split_url[1] + url
  end
end
