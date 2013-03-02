# -*- coding: utf-8 -*- 
class Record
  include Mongoid::Document
  include Mongoid::Timestamps

  field :staffid, type: String 
  field :record_person , type: String
  field :record_zone , type: String
  field :attend_date , type: Time

  belongs_to :user, class_name: 'Unirole::User'
  has_many :checkins

 # field :period, type: Date

  state_machine initial: :checking do
    event :register do
      transition [:checking] => :registered
    end


    event :submit do
      transition [:registered] => :submited
    end
  end

 # validates_presence_of :period, :user
#  validates_uniqueness_of :period, scope: [:user]

  # 自动生成本条记录的检查数据
  after_create do |record|
    if checkins.count == 0
      CheckUnit.all.each do |unit|
        record.checkins << Checkin.create!( checkunit_id: unit.id, behave_id: Behave.default.id )
      end
    end
  end

  def self.whenever_add
     create!
  end

  def self.state state
    where(state: state)
  end

  def self.get_needed_records id,time
    find_by(staffid: id, attend_date: time)
  end

  def update_needed_records hash
    checkins.update_all hash
  end
end
