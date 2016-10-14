class CartsController < ApplicationController
  # TODO: Мы не авторизуем пользователей для страницы с корзиной.
  #       Это делается для упрощения нашего сайте. Так как мы все равно храним
  #         информацию о корзине пользователя в сессии, которая будет недоступна, если
  #         пользователь покинет сайт или зайдет на него с другого устройства или браузера,
  #         то хранение корзины в анонимной сессии является простым и эффективным способом.


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
    load_cart
    # TODO!!! sendmail here please
    @goods.each do |good|
      OnlineCart.remove(good_id: good.id, session: session)
    end

    flash[:notice] = i18n.t('cart.order_sent')
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
end
