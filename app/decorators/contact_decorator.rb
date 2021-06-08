class ContactDecorator < Draper::Decorator
  delegate_all

  def credit_card
    "*#{object.credit_card[-4..-1]}"
  end

  def birth_date
    object.birth_date.strftime("%Y %B %d")
  end
end
