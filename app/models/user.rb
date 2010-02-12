require "spreadsheet/excel"
require 'parseexcel'

class User < ActiveRecord::Base
  
  has_many :user_rounds
  has_many :rounds, :through => :user_rounds
  
  has_many :user_answers
  has_many :answers, :through => :user_answers
  
  has_one :school
  
  acts_as_authentic do |c|
    c.login_field = 'email'
    c.validates_length_of_password_field_options = { :minimum => 5 }
  end
  
  validates_presence_of :user_name, :birth
  
  def activate_account!
    reset_perishable_token!
    Notifier.deliver_activate_account(self)
  end
  
  def activate!
      self.active = true
      save
  end
  
  private
    
    def self.create_schools_users
      workbook = Spreadsheet::Excel.new("#{RAILS_ROOT}/public/schools.xls")
      worksheet = workbook.add_worksheet("Skoly")
      worksheet.write(0, 0, "Skola")
      worksheet.write(0, 1, "Login")
      worksheet.write(0, 2, "Heslo")

      s = School.all(:conditions => 'LENGTH(email1) > 1')
      row = 1
      s.each do |school|
        psswd = newpass(8)
        nameschool = school.name.to_s
        worksheet.write(row, 0, nameschool.chars.normalize(:kd).to_s.gsub(/[^\x00-\x7F]/, ''))
        #worksheet.write(row, 0, "#{school.name}")
        worksheet.write(row, 1, "#{school.email1}")
        worksheet.write(row, 2, "#{psswd}")     
        row += 1
      
        #user = User.new 
        #user.user_name = school.name 
        #user.email = school.email1
        #user.birth = '-----'
        #user.password = psswd
        #user.password_confirmation = psswd
        #user.urole = 2
        #user.save
        #if user.save
        #  puts "#{school.name} - OK!"
        #  school.user_id = user.id 
        #  school.save
        #end              
      end
      workbook.close
    end
    
    def self.newpass(len)
      Array.new(len/2) { rand(256) }.pack('C*').unpack('H*').first
    end
  
end
