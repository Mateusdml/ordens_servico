class HomeController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  helper_method :valor_total  
  def valor_total (quantidade,valor)
    return quantidade*valor
  end

  helper_method :valor_desconto
  def valor_desconto (quantidade)
    if quantidade <10
      return 0
    elsif quantidade <20
      return 10
    elsif quantidade <30
      return 20
    else
      return 30   
    end
  end  

  helper_method :valor_final
  def valor_final (quantidade,valor)
      @valor_desconto = valor_desconto(quantidade)
    if @valor_desconto == 10
      return valor_total(quantidade,valor)*0.9
    elsif @valor_desconto == 20
      return valor_total(quantidade,valor)*0.8
    elsif @valor_desconto == 30
      return valor_total(quantidade,valor)*0.7
    else
      return valor_total(quantidade,valor)  
    end 
  end
end
