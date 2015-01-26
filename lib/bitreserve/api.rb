require 'bitreserve/api/endpoints'
require 'bitreserve/api/ticker'
require 'bitreserve/api/card'
require 'bitreserve/api/user'
require 'bitreserve/api/auth_token'

module Bitreserve
  module API
    include API::Ticker
    include API::Card
    include API::User
    include API::AuthToken
  end
end
