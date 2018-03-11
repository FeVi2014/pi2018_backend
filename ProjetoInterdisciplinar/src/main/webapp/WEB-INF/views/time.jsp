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
</head>
<body>
 <div id="app">
	<v-app dark>
		<v-toolbar dark color="blue-grey darken-4">
	     	<v-toolbar-side-icon></v-toolbar-side-icon>
	     	<v-toolbar-title>Futebol dos Pais</v-toolbar-title>
	     	<v-spacer></v-spacer>
	     	<v-toolbar-items>
	       	<v-btn flat href="/ProjetoInterdisciplinar/">Inicio</v-btn>
	       	<v-btn flat href="time">Times</v-btn>
     	</v-toolbar-items>
		 </v-toolbar>
   		<v-content>
     		<v-container>
     		<v-spacer></v-spacer>
       			<v-layout row mt5>
       				<v-flex xs4>
       					<v-form ref="timeForm" lazy-validation>
	      					<v-card>
						        <v-toolbar color="teal accent-4" dark>
						          <v-toolbar-title>{{time.id? 'Editar' : 'Novo'}} Time</v-toolbar-title>
						          <v-spacer></v-spacer>
	   							 </v-toolbar>
	      	 					<v-card-text>
	      	 						<input type="hidden" v-model="time.id">
	         						<v-text-field
							         	label="Nome"
							         	ref="nome"
							         	required
							         	:rules="[v => !!v || 'Campo obrigatório']"
							         	v-model="time.nome"
							         	color="green lighten-2" 
							         	@input="time.id? edit('', editingIndex, true) : ''"/>
	      							</v-card-text>
	      							<v-card-actions>
	      							<v-spacer></v-spacer>
	      								<v-btn color="success" @click="save()">Salvar</v-btn>
	      							</v-card-actions>
	      					</v-card>
      					</v-form>
     				 </v-flex>
     			    <v-flex xs9 offset-xs1>
				      <v-card>
				        <v-toolbar color="teal" dark>
				          <v-toolbar-title>Times</v-toolbar-title>
				          <v-spacer></v-spacer>
				          <v-btn icon>
				            <v-icon>search</v-icon>
				          </v-btn>
				        </v-toolbar>
				        <v-list two-line v-if="lista.length > 0">
				          <template v-for="(item, index) in lista">
           						<v-divider v-if="index !=0"></v-divider>
				           		<v-list-tile avatar>
				                <v-list-tile-avatar icon>
                					<v-icon style="font-size: 45px;" color="grey lighten-1">insert_photo</v-icon>
              					</v-list-tile-avatar>
				              <v-list-tile-content>
				                <v-list-tile-title>{{item.nome}}</v-list-tile-title>    
				              </v-list-tile-content>
				                <v-list-tile-action>
				                <v-layout row>
				                	<v-flex xs6>
				                	   <v-tooltip bottom>
								              <v-btn icon slot="activator" @click="edit(item, index, false)"> 
								                <v-icon color="blue lighten-1">create</v-icon>
								              </v-btn>	
								              <span>Editar</span>						              						                    
   									  	</v-tooltip>
						              </v-flex>
						              <v-flex xs6>
						               <v-tooltip bottom>
							                <v-btn icon slot="activator" @click="del(item, index)">
							                	<v-icon color="red">delete</v-icon>
							                </v-btn>
						                    <span>Excluir</span>
   									  </v-tooltip>
						            </v-flex>
						        </v-layout>
					            </v-list-tile-action>
				            </v-list-tile>
				          </template>
				        </v-list>
				        <v-card-text v-else>
				        	<p class="warning_messages">{{ emptyListMessage }}</p> 
				        </v-card-text>
				      </v-card>
				   </v-flex>
    			</v-layout>
     		</v-container>
   		</v-content>
   		 <v-dialog v-model="modal.show" max-width="300px">
	        <v-card>
	          <v-card-title> {{modal.title}} </v-card-title>
	          <v-card-text>
				{{modal.message}}
	          </v-card-text>
	    		<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn color="info" @click="modal.show = false">Ok</v-btn>
				</v-card-actions>
	        </v-card>
      	</v-dialog>
 	</v-app>
 </div>		
<script type="text/javascript">
var app = new Vue({
  el: '#app',
  data: {
	time:{
		id: '',
	    nome: ''
	},
	modal: {
		show: false,
		title:'',
		menssage: ''
	},
	lista: [],
	emptyListMessage:'Não há times cadastrados',
	editingIndex: null
  },
  created(){
	this.list()  
  },
  methods:{
	refresh(){
		this.time.id = null
		this.$refs.timeForm.reset()
	},
	showModal(res){
		if(res.status == '200') this.modal.title = "Sucesso!"
		else this.modal.title = "Atenção!"
		this.modal.message = res.message
		this.modal.show = true
		console.log(res)
	},
	save(){
		if (this.$refs.timeForm.validate()) {
			if(!this.time.id){
				delete this.time.id
			}
			$.ajax({
				url:'time/save',
				type:'POST',
				data: this.time,
				success: (response => {
					this.showModal(response)
					this.list()
				}),
				error: (response => {
					this.showModal(response)
				})
			});
		}
	},
	list(){
		$.ajax({
			url:'time/list',
			type:'POST',
			success: (response => {
				this.refresh()
				this.lista = response.data.reverse();
			}),	
			error: (response => {
				this.emptyListMessage = response.message	
			})	
		})
	},
	del(time, index){
		$.ajax({
			url:'time/delete/',
			type:'POST',
			data: time,
			success: (response => {
				this.showModal(response)
				this.refresh()
				this.lista.splice(index, 1)
			}),	
			error: (response => {
				this.showModal(response)
			})	
		})
	},
	edit(selecionado, index, editing){
		if(editing) {
			this.lista[index].nome = this.time.nome
		} else {
			this.time.id = selecionado.id
			this.time.nome = selecionado.nome
			this.editingIndex = index
			this.$nextTick(this.$refs.nome.focus())
		}
	},
  }
})
</script>
</body>
</html>