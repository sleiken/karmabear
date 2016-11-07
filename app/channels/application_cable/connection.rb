module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_giver

    def connect
      self.current_giver = find_verified_giver
    end

    protected

    def find_verified_giver
      if current_giver = Giver.find_by(id: cookies.signed[:giver_id])
        current_giver
      else
        reject_unauthorized_connection
      end
    end
  end
end
