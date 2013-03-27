# -*- coding: utf-8 -*-
class StaffRecord
  include Mongoid::Record
  
  def self.get_record id,time
    by_period(time.to_date-1,time.to_date+1).find_by(staffid: id)
  end

  def self.by_period first,last  
    between(created_date: [first,last])
  end

  def self.fast_register arg
    Department.new(arg[:dept_id]).users.map do | user |
      record = get_record user.staffid,arg[:time]
      record.checkins.update_all(behave_id: arg[:behave_id])
      record.update_attribute(:attend_date,Date.today)
      record.register
    end
  end

  def self.trainee_register arg
    TraineeRecord.register arg
  end

  def self.get_tasks  records
    if records
      tasks = records.map do | record |
        user =  User.resource(record.staffid)
        { dept_id: user.dept_id, 
          created_at: record.created_date,
          dept_name: user.dept_name
        }
      end
      tasks.uniq
    end
  end

  def self.query params ,dept_id ,map =""
    if params[:type].eql?("attach")
      if params[:order].eql?("false")  #不排序 有两种查询(是不是考勤项) 暂时不做根据考勤项来查询
        map += ".where(#{params[:field].to_sym}: /#{params[:value]}/)"
      else
         map # 这里是根据 字段的升序 和降序差需代码 由 simlegate 来完成！
      end 
    else
      if params[:start_time]
        map += ".by_period('#{params[:start_time]}','#{params[:end_time]}')" unless params[:start_time].empty?
        params[:dept_id]&&!params[:dept_id].empty?     ? map += ".in(staffid: #{Webservice.users_with_subdept(params[:dept_id])})" :
        params[:region_id]&&!params[:region_id].empty? ? map += ".in(staffid: #{Webservice.users_with_subdept(params[:dept_id])})" :
        params[:cell_id]&&!params[:cell_id].empty?     ? map += ".in(staffid: #{Webservice.users_with_subdept(params[:dept_id])})" : map
      end
    end
    eval("where(record_zone:'#{dept_id}').state('registered')"+map)
  end



# arg[0]: 用户id,arg[1]:用户名字，arg[2]:用户工号， arg[3]:昵称，
# arg[4]: 记录人名字，arg[5]: 记录人id, arg[6]:记录人区域id ，arg[7]:记录人区域名字， ,arg[8]: 考勤日期
  def self.new_record *arg
    create!(staffid: arg[0],
                      staff_name: arg[1],
                      user_no: arg[2],
                      nick_name: arg[3],
                      record_person_name: arg[4],
                      record_person: arg[5],
                      record_zone: arg[6],
                      record_zone_name: arg[7],
                     )
  end

  def self.auto_submit
    where(attend_date: Date.today).state("registered").each do |record|
      record.submit
    end
  end
end
