text = <<TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT
p text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/) 
# ?は「〜が１文字、または無し」を意味する
# .は「任意の１文字」を意味する

html = <<HTML
<select name="game_console">
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
HTML
# [.]は任意の文字、+は「直前の文字が１文字以上」を意味する
# /は//の中では使えないので「\」でエスケープする
p html.scan(/option value="([a-z0-9_]+)">(.+)<\/option/)

html = <<HTML
<select name="game_console">
<option value="none"></option>
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
HTML
p html.scan(/option value="([a-z0-9_]+)">(.*)<\/option/) # *は「直前の文字が０文字以上」を意味する

html = <<HTML
<select name="game_console">
<option value="none"></option>
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
HTML
p html.scan(/option value="([a-z0-9_]+)"(?: selected)?>(.*)<\/option/)