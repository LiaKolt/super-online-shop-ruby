class CartsController < ApplicationController
  # TODO: Мы не авторизуем пользователей для страницы с корзиной.
  #       Это делается для упрощения нашего сайте. Так как мы все равно храним
  #         информацию о корзине пользователя в сессии, которая будет недоступна, если
  #         пользователь покинет сайт или зайдет на него с другого устройства или браузера,
  #         то хранение корзины в анонимной сессии является простым и эффективным способом.

  # TODO: В данной версии этого приложения мы не реагируем на ошибки, которые могут возникнуть в
  #         процессе работы нашего приложения. Это плохо, так как пользователь не сможет понять
  #         что пошло не так и что ему делать дальше.

  before_action :empty_flash, except: [:proceed]

  # TODO: На многих интернет магазинах принято спрашивать у пользователя о его дальнейших действиях.
  #       Возможно пользователь, после добавления товара в корзину желает продолжить ознакомление со
  #         список товаров на сайте и пока не готов перейти в корзину для оплаты.
  def create
    OnlineCart.set(
      good_id: params[:good_id],
      good_amount: OnlineCart.get(good_id: params[:good_id], session: session) + 1,
      session: session
    )
    load_cart

    render :show
  end

  def show
    load_cart

    render :show
  end

  def destroy
    OnlineCart.remove(good_id: params[:good_id], session: session)
    load_cart

    render :show
  end

  def proceed
    # TODO: Данный метод можно (и нужно!) значительно улучшить. Например, разбить его на функции,
    #         например, одна будет подготавливать заказ пользователя, другая отправлять данные,
    #         третья, очищать коризну. Можно пойти еще дальше. Функцию очистки корзины перенести в
    #         класс OnlineCart. Другие функции вынести в concern Cart.

    load_cart
    goods = OnlineCart.new(session: session).goods
    order = Good.where(id: OnlineCart.ids(session: session)).map{|g| {item: g, count: goods[g.id.to_s]}}
    OrderMailer.order_email(user: order_params, order: order).deliver_now
    @goods.each do |good|
      OnlineCart.remove(good_id: good.id, session: session)
    end

    flash[:notice] = I18n.t('cart.order_sent')
    render :show
  end

  # TODO: В интернет магазинах также есть возможность изменить количество заказываемого товара.
  #       У нас для этого все готово. Есть метод OnlineCart.set, который позволяет изменять количество
  #         товара. Все, что нам остается сделать, это добавить метод #update в данный контроллер

  # TODO: Также имеет смысл добавить метод "destroy_all", который бы очищал карщину пользователя

  private

  def load_cart
    @goods = Good.where(id: OnlineCart.ids(session: session))
  end

  def order_params
    params.permit(:user_email, :user_phone, :user_address)
  end

  def empty_flash
    flash[:notice] = nil
  end
end
