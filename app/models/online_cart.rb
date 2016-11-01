# TODO: Данный класс по работе с корзиной использует объект сессии для хранения данных
#       Это не совсем удобно, так как сессия имеет ограниченное время жизни.
#       Как вариант, можно создать таблицу и хранить корзину пользователя там.
#       При этом данные не исчезнут, если пользователь закрыл браузер, например,
#         и будут доступны с любого браузера и устройства.

class OnlineCart
    def initialize(session:)
        @session = session
    end

    def goods
        @session[:cart]  ||= {}
        @session[:goods] ||= {}
    end

    def self.goods(session:)
        new(session: session).goods
    end

    def self.get(good_id:, session:)
        new(session: session).goods[good_id.to_s].to_i
    end

    def self.ids(session:)
       new(session: session).goods.keys
    end

    def self.set(good_id:, good_amount:, session:)
        new(session: session).goods[good_id.to_s] = good_amount
    end

    def self.remove(good_id:, session:)
        new(session: session).goods.delete(good_id.to_s)
        true
    end

    def self.has_good?(good_id:, session:)
        new(session: session).goods.keys.include?(good_id.to_s)
    end
end