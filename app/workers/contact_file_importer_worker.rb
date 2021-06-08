class ContactFileImporterWorker
  include Sidekiq::Worker

  def perform(contact_file_id)
    ContactFileImporterService.new(contact_file_id).import_contact_file_data
  end
end
