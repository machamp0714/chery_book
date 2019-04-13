# 8.8 状態を保持するモジュールの作成
module AwesomeApi
  @base_url = ""
  @debug_mode = false

  class << self
    def base_url=(value)
      @base_url = value
    end

    def base_url
      @base_url
    end

    def debug_mode=(value)
      @debug_mode = value
    end

    def debug_mode
      @debug_mode
    end
  end
end

AwesomeApi::base_url = 'http://localhost3000'
AwesomeApi::debug_mode = true

p AwesomeApi::base_url
p AwesomeApi::debug_mode

# 「唯一、１つだけ」の状態になっている事が望ましい場合は存在する。
# 「唯一、１つだけ」のオブジェクトを作る手法のことをシングルトンパターンと呼ぶ