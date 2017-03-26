{
  :ja => {
    :attributes => {
    },
    :helpers => {
      :submit => {
        :type003_article => {
          :create => "送信",
          :update => nil,
        },
      },
    },
    :activerecord => {
      :models => {
        :type003_article => "もりだくさん個人情報登録",
      },
      :attributes => {
        :type003_article => {
          :full_name           => "氏名",
          :full_name_hiragana  => "ふりがな",
          :postal_code         => "郵便番号",
          :tel                 => "連絡先電話番号",
          :email               => "連絡先メールアドレス",
          :confirm_email       => "確認用メールアドレス",
          :prefecture_name     => "都道府県",
          :city_address        => "市区町村",
          :number_address      => "番地",
          :house_name          => "ビル名・部屋番号",
          :full_address        => "住所",

          :first_name          => "姓",
          :last_name           => "名",
          :first_name_hiragana => "姓(ふりがな)",
          :last_name_hiragana  => "名(ふりがな)",
          :first_postal_code   => "郵便番号(左)",
          :last_postal_code    => "郵便番号(右)",
          :first_tel           => "市外局番",
          :middle_tel          => "市内局番",
          :last_tel            => "加入者番号",
          :legal_accept_key    => "プライバシーポリシー",

          :created_at          => "登録日時",
        },
      },
    },
  },
}
