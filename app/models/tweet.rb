class Tweet < ActiveRecord::Base
    
    def initialize(params ={})
        
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = "ZyPvIcCwEyd0kd6ztHBl0msMR"
            config.consumer_secret     = "kHltPiJJX575b3fzGjXH3x6rm27VrBJYPLB3tdTP2UHhBjgqq0"
            config.access_token        = "3022479862-glzHgKRheiygQJ088oIzhUfZWPzzJpSlhDdiOaA"
            config.access_token_secret = "It3AxP9in2fWu8Wg5Ju046oIVucDmPjPHh2oyYX0wEJAP"
        
    end
    super
    end
    
    def read_message
        
        return "No hay usuario" if self.user.blank?
        @client.user_timeline(self.user).first.text
    end
    
    def show_message_by_url
        return "URL no existe" if self.url.blank?
        @client.status(self.url)
    end
    def update_status
        return "No hay estatus" if self.message.blank?
        @client.update(self.message)
    end
    
end
