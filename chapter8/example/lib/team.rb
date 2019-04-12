require './lib/deep_freezable'

class Team
  extend DeepFreezable

  COUNTRIES = deep_freezable(['Japan', 'US', 'India'])
end