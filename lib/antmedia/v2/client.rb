# frozen_string_literal: true

require 'uri'
require 'oj'
require 'faraday'

require 'antmedia/v2/client/version'
require 'antmedia/v2/client/broadcasts'

module Antmedia
  module V2
    class Client
      include Antmedia::V2::Client::Version
      include Antmedia::V2::Client::Broadcasts

      attr_reader :endpoint

      def initialize(endpoint:)
        @uri = URI.parse(endpoint)
      end

      private

      def client_host
        "#{@uri.scheme}://#{@uri.host}:#{@uri.port}"
      end

      def client
        @client ||= Faraday.new(client_host) do |client|
          client.headers['Content-Type'] = 'application/json'
        end
      end

      def request(http_method:, endpoint:, params: {})
        response = if params.empty?
                     client.public_send(http_method, "#{@uri.path}#{endpoint}")
                   else
                     client.public_send(http_method, "#{@uri.path}#{endpoint}", params.to_json)
                   end

        return Oj.load(response.body) if response.status == 200

        raise "Code: #{response.status}, response: #{response.body}"
      end
    end
  end
end
