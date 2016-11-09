module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_manager

    def connect
      self.current_manager = find_verified_manager
      logger.add_tags 'ActionCable', current_manager.id, current_manager.email
    end

    protected

    def find_verified_manager
      if $current_manager
        Manager.find_by(id: $current_manager.id)
      else
        reject_unauthorized_connection
      end
    end
  end
end
