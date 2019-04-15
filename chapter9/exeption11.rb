# 9.6.4 例外処理と戻り値
def some_method(n)
  begin
    1 / n
    'OK'
  rescue
    'error'
  ensure
    'ensure' # ensure節ではreturnは使わない
  end
end

p some_method(1)
p some_method(0)