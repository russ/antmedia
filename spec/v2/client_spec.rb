# frozen_string_literal: true

RSpec.describe Antmedia::V2::Client do
  ANTMEDIA_APPLICATION = 'http://mediaserver:5080/LiveApp'

  let(:client) do
    Antmedia::V2::Client.new(endpoint: ANTMEDIA_APPLICATION)
  end

  let(:stream_id) do
    'zB8NWz5YGkOo1601328273306'
  end

  it 'gets the server version' do
    VCR.use_cassette('client/v2/version') do
      client.version.tap do |response|
        expect(response.fetch('versionName', nil)).to_not eq(nil)
        expect(response.fetch('versionType', nil)).to_not eq(nil)
        expect(response.fetch('buildNumber', nil)).to_not eq(nil)
      end
    end
  end

  it 'creates a broadcast' do
    VCR.use_cassette('client/v2/broadcasts_create') do
      client.broadcasts_create(name: 'test').tap do |response|
        expect(response.fetch('streamId')).to_not eq(nil)
      end
    end
  end

  it 'gets the broadcasts count' do
    VCR.use_cassette('client/v2/broadcasts_count') do
      client.broadcasts_count.tap do |response|
        expect(response.fetch('number', 0)).to eq(1)
      end
    end
  end

  it 'gets the general webrtc receive low level stats' do
    VCR.use_cassette('client/v2/broadcasts_webrtc_receive_low_level_stats') do
      client.broadcasts_webrtc_receive_low_level_stats.tap do |response|
        expect(response.fetch('audioReceiveStats', nil)).to_not eq(nil)
        expect(response.fetch('videoReceiveStats', nil)).to_not eq(nil)
      end
    end
  end

  it 'gets the general webrtc send low level stats' do
    VCR.use_cassette('client/v2/broadcasts_webrtc_send_low_level_stats') do
      client.broadcasts_webrtc_send_low_level_stats.tap do |response|
        expect(response.fetch('audioSendStats', nil)).to_not eq(nil)
        expect(response.fetch('videoSendStats', nil)).to_not eq(nil)
      end
    end
  end

  it 'gets a broadcast object' do
    VCR.use_cassette('client/v2/broadcast') do
      client.broadcast(stream_id).tap do |response|
        expect(response.fetch('streamId', nil)).to_not eq nil
      end
    end
  end

  it 'gets a broadcast stream info object' do
    VCR.use_cassette('client/v2/broadcast_stream_info') do
      client.broadcast_stream_info(stream_id).tap do |response|
        expect(response.count > 0).to eq true
        expect(response.first.fetch('videoHeight')).to_not eq(nil)
      end
    end
  end

  it 'gets a broadcast statistics object' do
    VCR.use_cassette('client/v2/broadcast_statistics') do
      client.broadcast_statistics(stream_id).tap do |response|
        expect(response.fetch('totalWebRTCWatchersCount')).to eq(1)
      end
    end
  end

  it 'gets a broadcast rtmp to webrtc status object' do
    VCR.use_cassette('client/v2/broadcast_rtmp_to_webrtc_stats') do
      client.broadcast_rtmp_to_webrtc_stats(stream_id).tap do |response|
        expect(response.fetch('streamId', nil)).to_not eq nil
      end
    end
  end
end
