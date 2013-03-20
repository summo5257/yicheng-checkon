
jQuery(function(){ 
    document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
    setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);



   var yy = { 
	"data" : "node_title", 
	// omit `attr` if not needed; the `attr` object gets passed to the jQuery `attr` function
	"attr" : { "id" : "node_identificator", "some-other-attribute" : "attribute_value" }, 
	// `state` and `children` are only used for NON-leaf nodes
	"state" : "open", // or "open", defaults to "closed"
	"children" : ["adf","asdf" ]
   }


	 $(".permission").jstree({
                "core" : { "initially_open" : [ "topic_root" ] }, 
                "json_data": {  "data": yy},
                "themes": { "theme": "default", "dots": false, "icons": true },
                "plugins": ["themes", "json_data", "ui"]
            })

/*
    $.get("tree_dept" , function(data){
	 $(".permission").jstree({
                "core" : { "initially_open" : [ "topic_root" ] }, 
                "json_data": {  "data": data },
                "themes": { "theme": "default", "dots": false, "icons": true },
                "plugins": ["themes", "json_data", "ui"]
            })
    });
*/

   



//   $('input[class=salary_time]').datepicker();

    function farmat(num){return num = num<10 ? "0"+num : num} 

    $.fn.datepicker.dates['zh-CN'] = {
				days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
			daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
			daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
			months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
			monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
			today: "今日"
	};
    $('.salary_time').datepicker({
                          format: 'yyyy-mm-dd',
                          language: 'zh-CN'
                          })

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

    function ajax_select(params,url,update,o){
      $.get(url,{dept_id :o.val()},function(html){
      $("#"+update).html(html);
      })
    }

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


//     alert(o.attr("order")=="false"&&o.val()=="")
     if(o.attr("order")=="false"&&o.val()=="") return false

        $.post("query_attach" ,{value: o.val() , 
			 field: o.attr("field"),
			 order: o.attr("order") 
			},
               function(html){
                   alert(html)
		   $(".show_query_result").html(html);
	       });
	
    }





