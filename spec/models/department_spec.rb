# -*- coding: utf-8 -*-

require 'spec_helper'

describe "部门数据" do
  before(:all) do
    @department = Department.new("4028809b3c6fbaa7013c6fbc39900380")
  end

  it "通过部门id和webservice返回部门中所有的员工信息" do
   @department.users.count.should == (Webservice.get_data("/dept/users/"+@department.id)).count
 end

  it "Users返回的结果应该是User对象的数据" do
    @department.users.each{|user| user.should be_instance_of(User)}
  end
end
