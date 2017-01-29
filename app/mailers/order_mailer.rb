class OrderMailer < ApplicationMailer
  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Thanks for your order")
  end

  def order_email_for_admin(order)
    @order = order
    mail(to: ADMIN_EMAIL, subject: "NEW ORDER FROM #{@order.email}")
  end
end
