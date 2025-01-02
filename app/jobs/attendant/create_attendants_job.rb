
class Attendant::CreateAttendantsJob
    include Sidekiq::Job


    def perform(kiost_id)
        Rails.logger.info " the kiost id in sidekiq is #{kiost_id}"
    end

    private

  
  end