class MissiveFilter
  include ActiveModel::Conversion
  # include ActiveModel::Validations
  extend ActiveModel::Naming
  # extend ActiveModel::Translation
  # モデルオブジェクトとして振る舞う為に、ActiveModel::Conversionをinclude
  # バリデーション機能を使えるように、ActiveModel::Validationsをinclude
  # オブジェクトをform_forで使えるようにActiveModel::Namingをextend
  # バリデーション時のエラーメッセージに日本語の属性名を使用できるように、ActiveModel::Translationをextend

  # プロパティの定義
  attr_accessor :date_begin, :date_end, :doc_type, :agency, :initial, :reference_no, :subject
  # 保存済みかどうかチェックする
  def persisted?; false; end

  def initialize(*args)
    return if args.empty?
    properties = args.extract_options!

    properties[:date] = Date.parse(properties[:date])
    @date = properties[:date]
  end

end