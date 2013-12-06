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
  attr_accessor :name, :date
  def persisted?; false; end
end