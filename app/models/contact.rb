# frozen_string_literal: true
require 'credit_card_validations/string'

class Contact < ApplicationRecord
  belongs_to :user

  validates :email, :name, :birth_date, :phone, :address, :credit_card, :franchise, :user, presence: true
  validates :email, uniqueness: { scope: :user_id }
  validates :name, format: { with: /\A[A-Za-z0-9-]*\z/ }
  validate :phone_format
  validate :date_format
  validate :credit_card_format

  after_initialize :init_franchise
  attr_encrypted :credit_card, key: Base64.decode64(Rails.application.credentials.encryption_key)

  private

  def phone_format
    return unless phone

    format_1 = /\A[(][+][0-9]{2}[)] [0-9]{3} [0-9]{3} [0-9]{2} [0-9]{2}\z/
    format_2 = /\A[(][+][0-9]{2}[)] [0-9]{3}-[0-9]{3}-[0-9]{2}-[0-9]{2}\z/

    errors.add(:phone, :invalid, message: "invalid phone format") unless phone=~format_1 || phone=~format_2
  end

  def date_format
    return unless birth_date

    basic_format = Time.parse(birth_date_before_type_cast).strftime('%Y%m%d')
    extend_format = Time.parse(birth_date_before_type_cast).strftime('%F')

    errors.add(:birth_date, :invalid, message: "invalid date format") unless basic_format == birth_date_before_type_cast || extend_format == birth_date_before_type_cast
  end

  def credit_card_format
    return if valid_credit_card?

    errors.add(:credit_card, :invalid, message: "invalid credit card format")
  end

  def init_franchise
    return unless valid_credit_card?

    self.franchise = credit_card.credit_card_brand_name
  end

  def valid_credit_card?
    return unless credit_card

    credit_card.credit_card_brand_name
  end
end
