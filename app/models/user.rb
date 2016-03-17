class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
      before_save {
        name_array = name.split
        name_array.each do |name|
            name.capitalize!
        end
        name = name_array.join(" ")
    }
    
    validates :name, length: {minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: {minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: {minimum: 6 }, allow_blank: true
    
    validates :email,
                presence: true, 
                uniqueness: { case_sensative: false },
                length: { minimum: 3, maximum: 254}
                
    has_secure_password
    
end
