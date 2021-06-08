# frozen_string_literal: true

class User < ApplicationRecord
  has_many :contacts
  has_many :contact_logs
  has_many :contact_files

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
