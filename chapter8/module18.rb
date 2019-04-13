# 8.9.5 有効範囲を限定できるrefinements
module StringShuffle
  refine String do # refinementsが目的なのでrefineメソッドを使う
    def shuffle
      chars.shuffle.join
    end
  end
end

# p 'Alice'.shuffle

class User
  using StringShuffle # refinementsを有効にする

  def initialize(name)
    @name = name
  end

  def shuffled_name
    @name.shuffle
  end
end

user = User.new('Alice')
p user.shuffled_name
p 'Alice'.shuffle # Userクラスでしかshuffleメソッドは使えないのでエラーが生じる