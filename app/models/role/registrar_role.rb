# -*- coding: utf-8 -*-
module RegistrarRole

  def attend_depts  #返回一个文员的考勤树
    @depts ||= $ACCESSOR.attend_tree(staffid)
  end

  def dept_ids
    attend_depts[:children].map{ |x| x[:id]}
  end

  def trainee_tasks
    trainee_ids = Trainee.belong(self).map(&:_id)
    TraineeRecord.trainees.in(trainee_id: trainee_ids).asc(:state)
  end

  def users_with_subdept
   @users ||=  $ACCESSOR.dept_users_with_subdept(dept_id)
  end

  def tempregistrars
    dept_scope = $ACCESSOR.registrar_attend_scope(staffid)
    $ACCESSOR.users_with_role(:tempregistrar,dept_scope) 
  end
end
