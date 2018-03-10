<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body onload="load();">
		<input type="hidden" id="id_time">
		Nome: <input type="text" id="nome_time" required="required" name="nome_time"><br>
		<button onclick="submit();">Submit</button>
	
		<table id="table" border=1>
			<tr> <th> Nome </th> <th> Editar </th> <th> Excluir </th> </tr>
		</table>
			
<script type="text/javascript">
	data = "";
	submit = function(){
		if($("#id_time").val()){
			update();
		} else {
			save();
		}
	}
	save = function(){
		$.ajax({
			url:'time/save',
			type:'POST',
			data:{
				nome: $('#nome_time').val(),
			},
			success: function(response){
				alert(response.message);
				console.log(response)
				load();		
			},
			error: function(response){
				alert(response.message);
				console.log(response)
				load();		
			}
		});			
	}
	update = function(){
		$.ajax({
			url:'time/save',
			type:'POST',
			data:{
				id: $('#id_time').val(),
				nome: $('#nome_time').val(),
			},
			success: function(response){
				alert(response.message);
				console.log(response)
				load();		
			},
			error: function(response){
				alert(response.message);
				console.log(response)
				load();		
			}
		});			
	}
	delete_ = function(id){		 
		 $.ajax({
			url:'time/delete',
			type:'POST',
			data:{
				id: id
			},
			success: function(response){
				alert(response.message);
				console.log(response)
				load();
			},
			error: function(response){
				alert(response.message);
				console.log(response)
				load();		
			}
		});
	}
	edit = function (index){
		$("#id_time").val(data[index].id);
		$("#nome_time").val(data[index].nome);
	}
	load = function(){	
		$.ajax({
			url:'time/list',
			type:'POST',
			success: function(response){
				$('#id_time').val(''),
				$('#nome_time').val(''),
				data = response.data;
				$('.tr').remove();
				for(i=0; i<response.data.length; i++){					
					$("#table").append(
						"<tr class='tr'> <td> "+response.data[i].nome+" </td>" + 
						"<td> <a href='#' onclick= edit("+i+");> Edit </a></td>" + 
						"<td> <a href='#' onclick='delete_("+response.data[i].id+");'> Delete </a></td>"+
						"</tr>"
					);
				}			
			}				
		});
	}
</script>
</body>
</html>