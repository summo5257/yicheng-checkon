
jQuery(function(){ 
    document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
    setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
    
    function farmat(num){return num = num<10 ? "0"+num : num} 

    $('input[name=range_time]').daterangepicker(
	{
            ranges: {
		'今天': ['today', 'today'],
		'昨天': ['yesterday', 'yesterday'],
		'最近7天': [Date.today().add({ days: -6 }), 'today'],
		'最近30天': [Date.today().add({ days: -29 }), 'today'],
		'本月': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
		'上月': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
            }
	},
	function(start, end) {
	    $('input[name=end_time]').val(end.getFullYear()+"-"+farmat((end.getMonth()+1))+"-"+farmat(end.getDate()));
            $('input[name=start_time]').val(start.getFullYear()+"-"+farmat((start.getMonth()+1))+"-"+farmat(start.getDate()));

	}
    );   
});

    function query_records(){
     $.post("query" ,{start_time: $('input[name=start_time]').val() , 
		      end_time:  $('input[name=end_time]').val() ,
		      organization:($('#condition_dept').val()||  $('#condition_cell').val() || $('#condition_region').val()) 
		     },
             function(html){
		 $(".show_query_result").html(html);
	     });
    }


    function query_attach(o){


     alert(o.attr("order")=="false"&&o.val()=="")
     if(o.attr("order")=="false"&&o.val()=="") return false

        $.post("query" ,{value: o.val() , 
			 field: o.attr("field"),
			 order: o.attr("order") 
			},
               function(html){
		   $(".show_query_result").html(html);
	       });
	
    }






