class LegalAcceptInfo
  include ApplicationStaticRecord
  static_record [
    {key: "true",  name: "受諾する",   },
    {key: "false", name: "受諾しない", },
  ], attr_reader_auto: true
end
