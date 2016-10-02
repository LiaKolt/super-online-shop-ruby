class OnlineCart

    def self.load(object_class:, session_object:)
        return [] unless session_object.try(:[], :cart).try(:[], :goods)
        object_class.where(id: session_object[:cart][:goods].map{|g,c| g })
    end

    def self.add(object_instance:, session_object:)
    end

    def self.remove(object_instance:, session_object:)
    end

end