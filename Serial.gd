extends Node

const serial_res = preload("res://bin/gdserial.gdns")

var serial_port = serial_res.new()

var is_port_open = false

func _ready():
	is_port_open = serial_port.open_port('COM3', 115200)
	print(is_port_open)

func _process(delta):
	if(is_port_open):
		var message = serial_port.read_text()
		if(message.length()>0):
			for i in message:
				print(i)
