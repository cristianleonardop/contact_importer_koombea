# frozen_string_literal: true

class ContactFile < ApplicationRecord
  include AASM
  belongs_to :user
  after_create :import_contacts

  aasm :state do
    state :on_hold, initial: true
    state :processing, :failed, :finished

    event :start_process do
      transitions from: [:on_hold], to: :processing
    end
    event :fail_process do
      transitions from: [:processing], to: :failed
    end
    event :finish_process do
      transitions from: [:processing], to: :finished
    end
  end

  def import_contacts
    ContactFileImporterService.new(self).import_contact_file_data
  end
end
