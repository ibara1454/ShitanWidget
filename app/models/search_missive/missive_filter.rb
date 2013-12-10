# DBと無関連の自作モデルです
class DateRangeParser
  def parse(date_begin, date_end)
    # 無限の過去
    date_begin = Date.new('1752-9-14') if date_begin.empty?
    # 無限の未来
    date_end = Date.new('9999-12-31') if date_end.empty?
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

  # 名前空間を使用
  include SearchMissive
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
    @conditions << AcceptDate.arel_table[:date].in(DateRangeParser.new.parse(@date_begin, @date_end)) if @date_begin.present? or @date_end.present?
    @conditions << DocType.arel_table[:id].eq(@doc_type) if @doc_type.present?
    @conditions << Agency.arel_table[:name].matches(@agency) if @agency.present?
    @conditions << Missive.arel_table[:reference_no].eq(@reference_no) if @reference_no.present?
    @conditions << Missive.arel_table[:subject].matches(@subject) if @subject.present?
  end

  def filter_out
    # 先読みさせ
    result = Missive.includes(:accept_date, :doc_type, :agency, :initial, :document => :mime, :attachments => :mime)
    @conditions.each { |c| result = result.where(c) }
    return result
  end

end