class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :attendant_shifts, dependent: :destroy
  def check_in
    self.time_in = Time.current.in_time_zone('Asia/Kuala_Lumpur')
    save
  end
      
  def check_out
    self.time_out = Time.current.in_time_zone('Asia/Kuala_Lumpur')
    save
  end
  def duration
    return nil unless time_in && time_out 

    duration = time_out - time_in 
    format_duration(duration)
  end

  private
  def format_duration(duration)
    hours = (duration / 3600).to_i
    minutes = ((duration % 3600) / 60).to_i
    seconds = (duration % 60).to_i

    "#{hours} hours, #{minutes} minutes, #{seconds} seconds"
  end
end
