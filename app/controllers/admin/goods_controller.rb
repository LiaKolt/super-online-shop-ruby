class Admin::GoodsController < Admin::AdminController
  # TODO: В данной версии нашего интернет магазина мы не возвращаем информацию об ошибках и
  #         оставляем это на откуп администраторам, работающим с товарами. Это неудобно, так
  #         как не позволяет сразу идентифицировать проблему, возникшую во время той или иной
  #         операции с товаром.

  def create
    good = Good.new(good_params)
    good.save
    redirect_to admin_goods_path
  end

  def index
    @goods = Good.all
  end

  def update
    Good.find(params[:id]).update(good_params)
    redirect_to admin_goods_path
  end

  def destroy
    Good.find(params[:id]).destroy
    redirect_to admin_goods_path
  end

  private

  def good_params
    params.permit(:name, :price, :amount)
  end
end
