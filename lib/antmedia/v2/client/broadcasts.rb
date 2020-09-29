# frozen_string_literal: true

module Antmedia
  module V2
    class Client
      module Broadcasts
        def broadcasts_create(params = {})
          request(
            http_method: :post,
            endpoint: '/rest/v2/broadcasts/create',
            params: params
          )
        end

        def broadcasts_count
          request(
            http_method: :get,
            endpoint: '/rest/v2/broadcasts/count'
          )
        end

        def broadcasts_webrtc_receive_low_level_stats
          request(
            http_method: :get,
            endpoint: '/rest/v2/broadcasts/webrtc-receive-low-level-stats'
          )
        end

        def broadcasts_webrtc_send_low_level_stats
          request(
            http_method: :get,
            endpoint: '/rest/v2/broadcasts/webrtc-send-low-level-stats'
          )
        end

        def broadcast(broadcast_id)
          request(
            http_method: :get,
            endpoint: "/rest/v2/broadcasts/#{broadcast_id}"
          )
        end

        def broadcast_stream_info(broadcast_id)
          request(
            http_method: :get,
            endpoint: "/rest/v2/broadcasts/#{broadcast_id}/stream-info"
          )
        end

        def broadcast_statistics(broadcast_id)
          request(
            http_method: :get,
            endpoint: "/rest/v2/broadcasts/#{broadcast_id}/broadcast-statistics"
          )
        end

        def broadcast_rtmp_to_webrtc_stats(broadcast_id)
          request(
            http_method: :get,
            endpoint: "/rest/v2/broadcasts/#{broadcast_id}/rtmp-to-webrtc-stats"
          )
        end
      end
    end
  end
end
