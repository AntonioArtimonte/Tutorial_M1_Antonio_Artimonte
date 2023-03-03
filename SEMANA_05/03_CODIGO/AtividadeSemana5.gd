extends Node2D

var teste = false #Nao é utilizada
var valor = 0
var numero = 0 #variavel esta com palavra com acento
var lista = [] #faltou declarar a variavel lista
var nome = "Morilo"
var cont = 0		 #Faltou declarar variavel

func _on_Button_pressed():
	#Coletando dados inseridos pelo usuário
	numero = int($LineEdit.text) #Numero com acento novamente, e faltou $ para buscar o lineedit no nó
	$LineEdit.text = nome #Faltou criar variavel nome


func _on_Button2_pressed():
	#Incrementando o número inserido pelo usuário
	for i in range(10):
		numero += i #Variavel numero está com a escrita errada
		lista.append(numero) #Variavel numero está com a escrita errada
	$Label.text = str(numero) #Faltava transformar a variavel numero em string para passar para a Label
	print(lista)

func _on_Button3_pressed():
	#Mudando o nome do usuário de acordo com os dados da lista
	#Se houver algum número ímpar o nome deve adicionar "baldo" ao final
	
	#Nao era necessario usar while, já que não é necessario um loop
	#Nao era necessario utiliziar a variavel I

		
		if(lista[-1] % 2 == 1): #Para pegar o ultimo digito da lista era necessario utilizar lista[-1] e nao lista[i]
			cont = 1 #Tirei cont = cont + 1 e troquei por cont = 1
		
		if(cont == 0): #Tinha que mudar para que cont fosse = 0
			nome = nome + "baldo"
		$Label2.text = nome


