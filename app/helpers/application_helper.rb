module ApplicationHelper
    # TODO: Здесь мы используем самописное решение по склонению слов.
    #       В данном случае, для слова "товары"
    #       Существует gem "globalize" (https://github.com/globalize/globalize)
    #       в котором уже имеются все необходимые функции для склонения слов.
    def localize_goods(count)
        if count % 10 == 1 && count % 100 != 11
            "товар"
        elsif count == 0 || count > 5
            "товаров"
        else
            "товара"
        end
    end
end