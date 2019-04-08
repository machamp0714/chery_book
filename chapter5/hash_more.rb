# ハッシュについてもっと詳しく
## 5.6.1 ハッシュで使用頻度の高いメソッド
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.keys
p currencies.values
p currencies.has_key?(:italy) # has_key?/key?/include?/member?は全てエイリアスメソッド

## 5.6.3 ハッシュを使った擬似キーワード引数
def buy_burger(menu, options = {})
    drink = options[:drink]
    potato = options[:potato]
    if drink && potato
        puts "#{menu}セット: サイドメニューはdrinkとpotato"
    elsif drink
        puts "#{menu}セット: サイドメニューはdrink"
    else
        puts "#{menu}セット: サイドメニューはpotato"
    end
end
buy_burger('cheese_burger', drink: true, potato: true)
buy_burger('cheese_burger', drink: true)
buy_burger('cheese_burger', potato: true)
buy_burger('cheese_burger', drink: true, potato: true, salada: true) # 擬似キーワード引数は単なるハッシュであるため、どんなキーを渡してもエラーにならない