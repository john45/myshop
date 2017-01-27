class OrderMailer < ApplicationMailer

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Thanks for your order")
  end
end
