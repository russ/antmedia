# frozen_string_literal: true

module Antmedia
  module V2
    class Client
      module Version
        def version
          request(
            http_method: :get,
            endpoint: '/rest/v2/version'
          )
        end
      end
    end
  end
end
