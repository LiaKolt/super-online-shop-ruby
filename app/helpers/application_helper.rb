module ApplicationHelper
  # TODO: Здесь мы используем самописное решение по склонению слов.
  #       В данном случае, для слова "товары"
  #       Существует gem "globalize" (https://github.com/globalize/globalize)
  #       в котором уже имеются все необходимые функции для склонения слов.
  def localize_goods(count)
    ending = count % 100
    if ending >= 11 && ending <= 19
      I18n.t('goods.plural.many')
    else
      ending = count % 10
      if ending == 1
        I18n.t('goods.plural.one')
      elsif ending > 1 && ending <=4
        I18n.t('goods.plural.other')
      else
        I18n.t('goods.plural.many')
      end
    end
  end
end
