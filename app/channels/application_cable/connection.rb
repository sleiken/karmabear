module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_giver

    def connect
      self.current_giver = find_verified_giver
    end

    protected

    def find_verified_giver
      p env['warden'].user
      if verified_giver = env['warden'].user
        verified_giver
      else
        reject_unauthorized_connection
      end
    end
  end
end
