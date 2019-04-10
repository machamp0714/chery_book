# 7.7.3 privateメソッドはサブクラスでも呼び出せる
class Product
  def to_s
    "name: #{name}" # サブクラスからでもスーパークラスのprivateメソッドを呼び出せる
  end

  private

    def name
      "A great movie"
    end
end

class DVD < Product
  private
    def name
      "A funny movie" # スーパークラスのprivateメソッドをオーバーライド
    end
end
dvd = DVD.new
p dvd.to_s