require './lib/deep_freezable'

class Bank
  extend DeepFreezable

  CURRENCIES = deep_freezable({ Japan: 'yen', US: 'dollar', India: 'rupee' })
end