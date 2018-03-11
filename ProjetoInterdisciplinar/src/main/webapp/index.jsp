<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Futebol dos Pais - Times</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
<link href="https://unpkg.com/vuetify/dist/vuetify.min.css" rel="stylesheet">
<link href='css$sass/main.css' rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>	
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<style>
.welcome{
	width: 50%;
	margin: auto;
	font-size: 70px;
	text-align:center;
	padding-top:20%;
}
.welcome_footer{
	font-size: 12px;
}
</style>
</head>
<body>
 <div id="app">
	<v-app dark>
   		<v-content>
     		<v-container>
     		<div class="welcome">
	     		<p>Futebol dos Pais</p>
	     		<v-btn flat href="#">Sobre</v-btn>
		       	<v-btn flat href="time">Times</v-btn>
		       	<v-btn flat href="#">Campeonatos</v-btn>
		       	<v-btn flat href="#">Artilheiros</v-btn>
		       	<div class="welcome_footer">ps.: clique em times </div>
	       	</div>
 		</v-container>
     </v-content>
 </div>		
<script type="text/javascript">
var app = new Vue({
  el: '#app',
  data:{
	  
  }
})
</script>
</body>
</html>