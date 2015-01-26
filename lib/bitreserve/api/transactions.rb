module Bitreserve
  module API
    module Transaction
      def all
        request_data = RequestData.new(
          Endpoints::TRANSACTIONS,
          Entities::Transaction,
          authorization_header
        )
        Request.perform_with_objects(:get, request_data)
      end
    end
  end
end
