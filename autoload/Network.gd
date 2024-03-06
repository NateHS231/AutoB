extends Node2D

const PORT = 6969
const MAX_PLAYERS = 4

var server = null
var client = null

var ip_address = ''

func _ready():
	if OS.get_name() == 'Windows':
		ip_address = IP.get_local_addresses()[3]
	elif OS.get_name() == 'Android':
		ip_address = IP.get_local_addresses()[0]
	else:
		ip_address = IP.get_local_addresses()[3]
		
	
	for ip in IP.get_local_addresses():
		if ip.begins_with('192.168.')  and not ip.ends_with('.1'):
			ip_address = ip

	get_tree().connect('network_peer_connected', self, '_playerConnected')
	get_tree().connect("connected_to_server", self, '-connected_to_server')
	get_tree().connect("server_disconnected", self, '_server_disconnected')
	pass 

func host_server():
	server = NetworkedMultiplayerENet.new()
	server.create_server(PORT, MAX_PLAYERS)
	get_tree().set_network_peer(server)
	pass 

func updateAndJoin(id):
	ip_address = id
	join_server()
	pass

func join_server():
	client = NetworkedMultiplayerENet.new()
	client.create_client(ip_address, PORT)
	get_tree().set_network_peer(client)
	pass 
	
func _connected_to_server():
	print("succesful connection")
	pass

func _server_disconnected():
	print("disconnected")
	pass

func _playerConnected(id):
	pass


