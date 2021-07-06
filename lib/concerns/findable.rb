module Concerns::Findable

    def find_by_name(name)
        self.all.find{|i| i.name == name}
      end
    
      def find_or_create_by_name(song)
        self.find_by_name(song) || self.create(song)
      end
    
end