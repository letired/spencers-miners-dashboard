class Miner < ApplicationRecord
  enum api: { nanopool: 1, nicehash: 2 }
end
