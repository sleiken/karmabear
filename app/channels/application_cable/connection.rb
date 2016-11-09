module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_manager

    def connect
      self.current_manager = find_verified_manager
    end

    protected

    def find_verified_manager
      if verified_manager = Manager.find(1)
        verified_manager
      else
        reject_unauthorized_connection
      end
    end
  end
end
