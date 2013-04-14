# -*- coding: utf-8 -*-
class Crontask 

  # TODO should save in memory then insert db
  def self.produce_everyday_records 
    checkers = Webservice.get_data "/registrars"
    checkers.each do |checker_id |
      cu = User.resource(checker_id)
      cu.class_eval {include RegistrarRole}
      children =  cu.attend_depts["children"]
      if children   # 因为有些 区下面没有children 所以必须判断
        children.map do | dept |      
          Department.new(dept["id"]).users.map do | user |
            StaffRecord.new_record(user.staffid, 
                                   user.username,
                                   user.user_no ,
                                   user.nickname_display,
                                   cu.username, 
                                   cu.staffid ,
                                   cu.dept_id, 
                                   cu.dept_name 
                                   )
          end
        end
      end
      User.scoped.map do | user |  
        TraineeRecord.new_record user.id, user.name,"","",cu.username,cu.staffid, cu.dept_id,cu.dept_name
      end
    end
  end

  def self.submit_everyday_records
    [StaffRecord , TraineeRecord].each do |item |
      item.where(attend_date: Date.today).state("registered").each{ |record|  record.submit }
    end
  end

end
