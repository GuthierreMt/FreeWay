extends Node

var client
var connected = false

var txt = ''

const ip = "192.168.0.4"

const port = 80

func _ready():
	client = StreamPeerTCP.new()
	client.set_no_delay(true)
	client.connect_to_host(ip,port)
	if(client.is_connected_to_host()):
		connected = true
		print('conectei')

func _process(delta):
	if connected and not client.is_connected_to_host():
		connected = false
	else:
		_readWebSocket()
	
func _readWebSocket():
	while client.get_available_bytes()>0:
		var message = client.get_utf8_string(client.get_available_bytes)
		
		if message == null:
			continue
		elif message.length()>0:
			
			for i in message:
				if i=='\n':
					print(txt)
					txt = ''
				else:
					txt = txt + i
