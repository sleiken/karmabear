module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_manager

    def connect
      self.current_manager = find_verified_manager
    end

    protected

    def find_verified_manager
      if Manager.find($current_manager[:id])
        Manager.find($current_manager[:id])
      else
        Manager.first
      end
    end
  end
end
