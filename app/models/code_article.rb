require "slim/erb_converter"

class CodeArticle
  include ApplicationMemoryRecord
  memory_record [
    {key: "eda44ea34434a913a22402b20232cb64", name: "いちばん簡単な例は？",                       point: "el に適用範囲。data に変数。{{変数名}}で埋め込み"},
    {key: "b7aa501a4000539b4dda4d680ccfa18e", name: "Vue.js の導入が難しいときは？",              point: "script で読み込む。単体で使うならこれで十分"},
    {key: "8754071d15aeeec3b21e148c6c286337", name: "手元で Hello, World してみるには？",         point: "10秒あればできる！？"},
    {key: "07fcf58ac2bb9c12e7667f798a195df2", name: "a + b の結果を表示するには？",               point: "computed の結果はメモ化される"},
    {key: "146ba6d4f9bc0bb937ca1d7a291723df", name: "デバッグの方法は？",                         point: "Chrome 用の拡張機能を入れてデベロッパーツールで Vue 選択"},
    {key: "e042890b63675835e989f3483be481e5", name: "双方向データバインディングとは？",           point: "コンソールで vm.a の値を変更すると画面の値も変わる"},
    {key: "ddf81d5667d3bc0b32d3fd917ec8e3ce", name: "INPUTに同じ変数を割り当てるとどうなる？",    point: ""},
    {key: "6bdd9f85e2472076b63a95bf0704e31f", name: "合計金額をリアルタイムに表示するには？",     point: "重い計算は computed のメソッドでメモ化"},
    {key: "e5d2727fe031889857733d1b40a4b135", name: "リアルタイムにプレビューするには？",         point: "{{}} のなかで簡単な処理が書ける"},
    {key: "32e51fa1a65875690295cb029137c2a9", name: "数値入力している色を確認するには？",         point: ":style は特別扱いなので「魔法」が効く"},
    {key: "9060579e4d111ba8307f55905518a72d", name: "色をダイアログでも選択するには？",           point: "両方の input に同じ変数を割り当てる。type=\"color\" は HTML5 の機能"},
    {key: "62401e72268f5b2065ebc8c369eaf8af", name: "色選択コントローラーを自作するには？",       point: "iPhone は type='color' に対応してない"},
    {key: "618af057a0761be0dff795359f916ce4", name: "開閉ボタンのラベルを切り替えるには？",       point: "フラグ変化に label 変数が反応"},
    {key: "4a7f54ec0a33a7a858996e54d343e3db", name: "WIP をつけると Merge 禁止にするには？",      point: ""},
    {key: "1175f83e66e75518981edcd03307ddc1", name: "承認しないと送信が押せないようにするには？", point: "offの状態では disabled=\"true\" でなく disabled=\"disabled\" になっている"},
    {key: "801311403683cd265bfa5e06be5d2aa5", name: "1回承認したら解除できないようにするには？",  point: "@change=\"a = true\" で常に true にしている"},
    {key: "aa8bf9b9228a699fb40d2bbd67751cfc", name: "パスワードのマスクを解除するには？",         point: "inputタグのtypeを切り替えても動いたけどVueの警告がでる"},
    {key: "42f3bffef8ee3e414ef3a3481d74683e", name: "入力中だけパスワードを表示するには？",       point: "debounce は lodash.js のメソッドで一定時間入力がないときの処理が書ける"},
    {key: "713af1d6f1ad985d5788dfd516734dc1", name: "いいねすると消えて文言を表示するには？",     point: "表示/非表示をがんばるのではなく if else 構文を使う"},
    {key: "e4d339247f6971d225cc441d8e8f0d6f", name: "1回だけスターできるようにするには？",        point: "once 修飾子で「1回だけ」の制限が効く"},
    {key: "a5325ec44e6642df004bbaed4a4f7470", name: "クリックで表示と編集を切り替えるには？",     point: "リターンとフォーカス外れで表示に戻る。$nextTick は次のフレームでの処理"},
    {key: "142ebc3088ebcff38bd788f7c525e6e6", name: "スターの数を瞬時に変更するには？",           point: "1文字入力(@keyup)で編集から抜けている"},
    {key: "eb2c62486354969e025d5fdc0dd40306", name: "このレビューは参考になりましたか？",         point: "@click=\"a = 'yes'\" のように書いてもいい"},
    {key: "1d2140405c2b4f90566e697670a24c85", name: "Youtube 風の Good Bad 評価をするには？",     point: "$once で定義したものは $emit で「1回だけ」実行"},
    {key: "7bd29fdd96c73c717ae6e5f4199d38e3", name: "行数に応じて縦幅を広げるには？",             point: "改行の数を行数と仮定している"},
    {key: "5479b32a572ce807a6acb05034de4d8c", name: "文章量に応じて縦幅を広げるには？",           point: "あまり厳密ではない。行数を予測できる場合だけ使える"},
    {key: "ec913a6b878dd55a88a1e0d3e4f63307", name: "計算しないと送信できないようにするには？",   point: "onXXX 系フックは @xxx と書く"},
    {key: "e864d49c98091b7a85626fa4bfd05b99", name: "大量の質問に答えてもらうには？",             point: "delay は lodash の機能"},
    {key: "1e26eea1225d6b8ddb633f69ecb314fa", name: "選択肢によって入力項目を切り替えるには？",   point: ""},
    {key: "ff6e6616ccac8f959e00cef92a205f2c", name: "文字の大きさを変更するには？",               point: "data- プレフィクスは予約語で dataset と対応"},
    {key: "75efb705e058fd7eb8e43360cf179336", name: "AJAX するには？",                            point: "axios ライブラリ便利 (Vue関係ない)"},
    {key: "7681a8828cbd7105d723561c2f62d4de", name: "次のフィールドにフォーカスを進めるには？",   point: "ref でタグに名前をつけておくと参照しやすい"},
    {key: "d104afe01bcede753814f19fab7ff513", name: "DELETEで前のフィールドに戻って消すには？",   point: "もし前のフィールドに戻るだけなら @keydown を @keyup に変更する"},
    {key: "761ea6d9790bdb12630ba520cad820a8", name: "一定時間立つとリダイレクトするには？",       point: "created は new Vue のあとで1回呼ばれる"},
    {key: "5c11c7ac72bc0953b74dce4cb5743aaf", name: "簡易漫画ビューアを作るには？",               point: ""},
    {key: "27c364be8d8a7f32d2198bf3c3dd1174", name: "アバター画像の配置調整をするには？",         point: "input に割り当てた変数から transform の書式を作っているだけ"},
    {key: "9813659f3df3fe67ba4144b81c8e3e7c", name: "利用規約を読んだことにされないためには？",   point: ""},
    {key: "72b487a3b893680fbf92db87bdb22299", name: "HTML5の機能だけで作るドラッグアンドドロップ", point: ""},
  ]

  def self.to_html(h)
    collect { |e| e.to_row(h) }.to_html
  end

  def to_row(h)
    {}.tap do |row|
      row["項目"]     = h.link_to(name, [self.class.name.underscore, id: key])
      row["ポイント"] = point.to_s.html_safe
    end
  end

  def next_info(sign = 1)
    self.class[(code + sign).modulo(self.class.count)]
  end

  def previous_info
    next_info(-1)
  end

  def to_pretty_html
    CodeRay.scan(html_source, :html).div
  end

  def to_simple_html
    s = html_source
    s = s.gsub(Regexp.union(*bootstrap_tags), "")
    s = s.gsub(/\s+class="\s*?"/, "") # 残った class=" " を削除
    CodeRay.scan(s, :html).div
  end

  def html_source
    s = Slim::ERBConverter.new(pretty: true, sort_attrs: false).call(partial_file.read)
    s = ERB.new(s).result(view_binding)
    s = s.gsub(/\n\s*\n/, "\n")                         # 無駄な空行を除去
    s = s.gsub(/<script>/) { |s| "\n#{s}" }             # <script> の上は一行空ける
    s = s.gsub(/>\s*(<\/textarea>)/m) { |s| ">#{$1}" }  # 空の textarea を1行にする
    s = s.gsub(/\s*^(<\/(?:label|span)>)/m) { |s| $1 }  # 行頭に来てしまっている </label> を上の行の最後に移動
    s = s.gsub(/><(template)/) { |s| ">\n<#{$1}" }      # ><template> を >\n<template> にする
  end

  def partial_file
    Rails.root.join("app/views/#{self.class.name.underscore.pluralize}/_#{key}.html.slim")
  end

  def view_binding
    ApplicationController.new.view_context.instance_eval { binding }
  end

  def bootstrap_tags
    [
      "control-label",
      "help-block",
      "padge",
      "img-thumbnail",
      "checkbox-inline",
      /form\-(inline|horizontal|group|control)/,
      /(panel|btn)\-?\w*/,
      /col\-md\-(offset\-)?\d+/,
      /list-group(\-item)?/,
    ]
  end
end
