# -*- coding: utf-8 -*-
class CountsController < ApplicationController
  before_filter :init_behaves , only: [:index]
	
  def index
    unless Count.addup("2013-03-01","2013-04-01","registered").empty?
     @stats = Count.counts_result(counts,@init).sort_by_field(:user_no)
    end
  end

  private 
    def init_behaves
      @init = Behave.all.inject({}) do |bh ,value|
        bh.merge({value.name => ""})
      end
    end
end

