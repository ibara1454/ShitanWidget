# DBと無関連の自作モデルです
class DateRangeParser
  def parse(date_begin, date_end)
    # 無限の過去
    date_begin = Date::GREGORIAN if date.empty?
    # 無限の未来
    date_end   = Date::JULIAN    if date.empty?
    # 時間のrangeオブジェクトを作成
    return Range.new(date_begin, date_end)
  end
end

class SearchMissive::MissiveFilter
  include ActiveModel::Conversion
  # include ActiveModel::Validations
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  # モデルオブジェクトとして振る舞う為に、ActiveModel::Conversionをinclude
  # バリデーション機能を使えるように、ActiveModel::Validationsをinclude
  # オブジェクトをform_forで使えるようにActiveModel::Namingをextend
  # バリデーション時のエラーメッセージに日本語の属性名を使用できるように、ActiveModel::Translationをextend
  #
  # プロパティの定義
  attr_reader :date_begin, :date_end, :doc_type, :agency, :reference_no, :subject
  # 保存済みかどうかチェックする
  def persisted?; false; end

  def initialize(attributes = {})
    # プロパティに値を代入
    attributes.each { |key, value| instance_variable_set(:"@#{key}", value) }
    # 濾過条件の集合
    @conditions = []
    # 条件要素がバラバラで同一性がないため、各条件別処理
    unless @date_begin.blank? and @date_end.blank?

      DateRangeParser.new.parse(@date_begin, @date_end)
    end


  end

  def filter_out(model)
  end

end