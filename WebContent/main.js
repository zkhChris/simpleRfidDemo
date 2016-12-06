$(document).ready(function(){
	     var x;
      $("#insert").click(function(){
          $("#select").toggle(1000);
          $("#require").toggle(1000);
          $("#edit").toggle(1000);
          $("#insertMenu").fadeToggle(1000);
          $("#update").fadeOut(1000);
          $("#select2").fadeOut(1000);
      	  $("#select3").fadeOut(1000);
      	  $("#select1").fadeOut(1000); 
      });

      $("#select").click(function(){
      	$("#insert").toggle(1000);
      	$("#require").toggle(1000);
      	$("#edit").toggle(1000);
      	$("#selectGroup").fadeToggle(1000);
      	$("#update").fadeOut(1000);
      	$("#select2").fadeOut(1000);
     	$("#select3").fadeOut(1000);
     	$("#select1").fadeOut(1000); 
       });

      $("#require").click(function(){
      	$("#insert").toggle(1000);
      	$("#select").toggle(1000);
      	$("#edit").toggle(1000);
      	$("#showMenu").fadeToggle(1000);
      	$("#update").fadeOut(1000);
      	$("#select2").fadeOut(1000);
     	$("#select3").fadeOut(1000);
     	$("#select1").fadeOut(1000); 
      });

      $("#edit").click(function(){
      	$("#insert").toggle(1000);
      	$("#select").toggle(1000);
      	$("#require").toggle(1000);
      	$("#editMenu").fadeToggle(1000);
      	$("#update").fadeOut(1000);
      	$("#select2").fadeOut(1000);
     	$("#select3").fadeOut(1000);
     	$("#select1").fadeOut(1000); 
      });

        $(".edit").click(function(){
        	x=$(this).attr("id");
        	$("#update").fadeToggle(1000);
        	$("#editMenu").fadeOut(1000);
        	$("#tq").attr("value",x);
        	$("#insert").toggle(1000);
          	$("#select").toggle(1000);
          	$("#require").toggle(1000)
        });
        
        $("#seleB1").click(function(){
        	$("#select2").fadeOut(1000);
        	$("#select3").fadeOut(1000);
        	$("#select1").fadeIn(1000);       	
        });
        
        $("#seleB2").click(function(){
        	$("#select1").fadeOut(1000);        	
        	$("#select3").fadeOut(1000); 
        	$("#select2").fadeIn(1000);       	
        });
        $("#seleB3").click(function(){
        	$("#select1").fadeOut();
        	$("#select2").fadeOut();
        	$("#select3").fadeIn(1000);        	
        });
        $("#seleB4").click(function(){
        	alert("数量最多的设备是："+$("#snum").text()+"\n"+"它的数目是："+$("#scount").text());
        });
        
       /* $("#rfidTagId").blur(function(){
  if($("#rfidTagId").val()==null||$("#rfidTagId").val()==""){
  	alert("请输入RFID标签");
};
});

  	      $("#deviceName").blur(function(){
  if($("#deviceName").val()==null||$("#deviceName").val()==""){
  	alert("请输入设备名");
  };
  });


  	      $("#deviceNum").blur(function(){
  if($("#deviceNum").val()==null||$("#deviceNum").val()==""){
  	alert("请输入设备型号");
  };
  });

           $("#identificationNum").blur(function(){
  if($("#identificationNum").val()==null||$("#identificationNum").val()==""){
  	alert("请输入出厂编号");
  };
  });

            $("#location").blur(function(){
  if($("#location").val()==null||$("#location").val()==""){
  	alert("请输入存放位置");
  };
  });

               $("#custodian").blur(function(){
  if($("#custodian").val()==null||$("#custodian").val()==""){
  	alert("请输入保管人");
  };
  });

            $("#responsiblePerson").blur(function(){
  if($("#responsiblePerson").val()==null||$("#responsiblePerson").val()==""){
  	alert("请输入责任人");
  };
  });   
*/
  });

