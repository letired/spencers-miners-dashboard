class PagesController < ApplicationController
  def home
    @miners = Miner.all
    @results = []
    @miners.each do |miner|
      @results = call_api(miner)
    end
  end

  private

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
    JSON.parse(results)
  end

  def nicehash_api(address)
    "nicehash"
  end
end
