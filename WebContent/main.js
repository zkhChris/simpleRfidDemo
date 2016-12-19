$(document).ready(function(){
	     var x;
      $("#insert").click(function(){
          $("#select").toggle(1000);
          $("#require").toggle(1000);
          $("#edit").toggle(1000);
          $("#insertMenu").fadeToggle(1000);
          $("#update").fadeOut(1000);
          $("#selectGroup").fadeOut(1000);
          $("#showSelectMenu").fadeOut(1000);
          $("#tongji").toggle(1000);
          $("#count").fadeOut(1000);
      });

      $("#select").click(function(){
      	$("#insert").toggle(1000);
      	$("#require").toggle(1000);
      	$("#edit").toggle(1000);
      	$("#selectGroup").fadeToggle(1000);
      	$("#update").fadeOut(1000);
      	$("#showSelectMenu").fadeOut(1000);
      	$("#tongji").toggle(1000);
      	$("#count").fadeOut(1000);
       });

      $("#require").click(function(){
      	$("#insert").toggle(1000);
      	$("#select").toggle(1000);
      	$("#edit").toggle(1000);
      	$("#showMenu").fadeToggle(1000);
      	$("#update").fadeOut(1000);
      	$("#selectGroup").fadeOut(1000);
      	$("#showSelectMenu").fadeOut(1000);
      	$("#tongji").toggle(1000);
      	$("#count").fadeOut(1000);
      });

      $("#edit").click(function(){
      	$("#insert").toggle(1000);
      	$("#select").toggle(1000);
      	$("#require").toggle(1000);
      	$("#editMenu").fadeToggle(1000);
      	$("#update").fadeOut(1000);
      	$("#showSelectMenu").fadeOut(1000);
      	$("#tongji").toggle(1000);
      	$("#count").fadeOut(1000);
      });

      $("#tongji").click(function(){
    	  $("#select").toggle(1000);
          $("#require").toggle(1000);
          $("#edit").toggle(1000);
          $("#insert").toggle(1000);
          $("#update").fadeOut(1000);
          $("#selectGroup").fadeOut(1000);
          $("#showSelectMenu").fadeOut(1000);
          $("#count").fadeToggle(1000);
      });
      
        $(".edit").click(function(){
        	x=$(this).attr("id");
        	$("#update").fadeToggle(1000);
        	$("#editMenu").fadeOut(1000);
        	$("#tq").attr("value",x);
        	$("#insert").toggle(1000);
          	$("#select").toggle(1000);
          	$("#require").toggle(1000);
          	$("#showSelectMenu").fadeOut(1000);
          	$("#tongji").toggle(1000);
        });
        
        $("#selectButtont").click(function(){
        	$("#selectGroup").fadeOut(1000);
        	$("#showSelectMenu").fadeIn(1000);
          	$("#insert").toggle(1000);
          	$("#edit").toggle(1000);
          	$("#require").toggle(1000);
          	$("#tongji").toggle(1000);
          	$("#count").fadeOut(1000);
          	var x=$("#s1").val();
          	switch(x){
          	case "RFID标签号":x="tagid";break;
          	case "设备名称": x="devicename";break;
          	case "设备型号": x="devicenum";break;
          	case "出厂编号": x="identy";break;
          	case "存放地点": x="location";break;
          	case "保管人": x="custodian";break;
          	case "责任人": x="respon";break;
          	}
          	//console.log(x);
          	
          	var y=$("#s2").val();
          	//console.log(y);
          	if(x==null||x==""||y==null||y==""){
          		alert("请填写表单！");
          	}
          	else{
          	var tableInsert="<table class='rfidTable'><tbody><tr><th>RFID标签号</th>	<th>设备名称</th><th>设备型号</th><th>出厂编号</th>						<th>存放地点</th><th>保管人</th><th>责任人</th></tr>";
          	for (temp in arr){  
          		if(arr[temp][x]==y){
          			tableInsert+="<tr>";
          			console.log(arr[temp]);
          			tableInsert+="<td>"+arr[temp]["tagid"]+"</td><td>"+arr[temp]["devicename"]+"</td><td>"+arr[temp]["devicenum"]+"</td><td>"+arr[temp]["identy"]+"</td><td>"+arr[temp]["location"]+"</td><td>"+arr[temp]["custodian"]+"</td><td>"+arr[temp]["respon"]+"</td></tr>"
          		}
          	}
          	tableInsert+="</tbody></table>"
          	console.log(tableInsert);
          	$("#showSelectMenu").html(tableInsert);
          	}
        });
        
       $("#s1").change(function(){
    	   var tar=$("#s1").val();
    	   var insert="<input type='text' list='valueList' class='inputlabel bre' id='s2'><datalist id='valueList'>";
           switch(tar){
           case "RFID标签号":for(var i=0;i<t1.length;i++){
        	   insert+=("<option value='"+t1[i]+"'/>");
           }
           insert+="</datalist>";
           $("#seleTar").html(insert);
           break;
           case "设备名称" :for(var i=0;i<t2.length;i++){
        	   insert+=("<option value='"+t2[i]+"'/>");
           }
           $("#seleTar").html(insert);break;
           case	"设备型号" :for(var i=0;i<t3.length;i++){
        	   insert+=("<option value='"+t3[i]+"'/>");
           }
           insert+="</datalist>";
           $("#seleTar").html(insert);break;
           case	"出厂编号" :for(var i=0;i<t4.length;i++){
        	   insert+=("<option value='"+t4[i]+"'/>");
           }
           insert+="</datalist>";
           $("#seleTar").html(insert);break;
           case	"存放地点":for(var i=0;i<t5.length;i++){
        	   insert+=("<option value='"+t5[i]+"'/>");
           }
           insert+="</datalist>";
           $("#seleTar").html(insert);break;
           case	"保管人":for(var i=0;i<t6.length;i++){
        	   insert+=("<option value='"+t6[i]+"'/>");
           }
           insert+="</datalist>";
           $("#seleTar").html(insert);break;
           case	"责任人":for(var i=0;i<t7.length;i++){
        	   insert+=("<option value='"+t7[i]+"'/>");
           }
           insert+="</datalist>";
           $("#seleTar").html(insert);break;
           }
    	   });
    	   
    	   //console.log(tar);
       });
     


