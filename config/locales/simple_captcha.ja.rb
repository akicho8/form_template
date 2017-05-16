{
  ja: {
    simple_captcha: {
      placeholder: "上の文字列をここに入力してください",
      label: "",
      refresh_button_text: "別の画像に変更",
      message: {
        # 特定のモデルだけ文言を変更したい場合はモデル名をキーにする
        # しかし、class.name.underscore ではなく downcase してしまっているため実際には _ を消さないとマッチしないので注意
        # PR しようかと思ったがもうメンテされてないようだ
        # user: "Userモデルのときに表示する文言",
        default: "入力した文字列が正しくありません",
      },
    },
  },
}
