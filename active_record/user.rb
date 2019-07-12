require './active_record.rb'

class User < ActiveRecordReplica

end

user = User.new(name: 'tatsuya', email: 'tatsuya@email.com')
p user.name
user.name = 'erisa'
p user.name