class Admin::GoodsController < Admin::AdminController
  def create
  end

  def show
  end

  def index
   # @goods = Good.all
  end

  def update
    good = Good.new(params[:good])
    if good.save

    else

    end
  end

  def destroy
  end
end
