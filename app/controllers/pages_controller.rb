class PagesController < ApplicationController
  def home
    @miners = Miner.all
    @results = []
    @miners.each do |miner|
      @results << call_api(miner)
    end
  end

  private
  require 'open-uri'
  def call_api(miner)
    case miner.api
    when "nanopool"
      nanopool_api(miner.address)
    when "nicehash"
      nicehash_api(miner.address)
    end
  end

  def nanopool_api(address)
    results = open("https://api.nanopool.org/v1/eth/balance/"+address).read
    nanopool = Hash.new()
    nanopool[:nanopool] = JSON.parse(results)
    nanopool
  end

  def nicehash_api(address)
    results = open("https://api.nicehash.com/api?method=stats.provider.ex&addr="+address).read
    nicehash = Hash.new()
    nicehash[:nicehash] = JSON.parse(results)
    nicehash
  end
end
