class FrontendShowCaseInfo
  include ApplicationStaticRecord
  static_record [
    {:name => "React動作確認用", :url => proc { [:frontend, :my_react001] }, :desc => "", },
    {:name => "Vue動作確認用",   :url => proc { [:frontend, :my_vue001]   }, :desc => "", },
  ], :attr_reader_auto => true

  def self.to_html(h)
    collect { |e|
      {}.tap do |row|
        row["名前"] = h.link_to(e.name, h.instance_eval(&e.url))
        row["説明"] = e.desc
      end
    }.to_quick_table
  end
end
