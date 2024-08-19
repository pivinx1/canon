extends Control

signal spawnProgram(program: String)

var rng = RandomNumberGenerator.new()

@export var entry_field: LineEdit
@export var echo_box: Label

func _ready():
	randomize()

const output: String = "Found node {hostname} @ {address}"
var services: Dictionary = globaldata.loadPorts()
var programs: Dictionary = globaldata.loadPrograms()

func _on_entry_field_text_submitted(new_text):
	var command: String = "> " + new_text
	echo(command)
	handleCommand(new_text)
	entry_field.text = ""

func echo(str: String):
	echo_box.text += str("\n" + str)

func handleCommand(command: String):
	var slicedCommand: PackedStringArray = command.rsplit(" ")
	print([slicedCommand])
	match slicedCommand[0].to_lower():
		"roundup":
			var agentArray: Array = globaldata.generateAgent(globaldata.currentSector, "generic")
			globaldata.connectionDict["hostname"] = agentArray[0]
			globaldata.connectionDict["address"] = agentArray[1]
			agentregistry.registerAgent("agent", agentArray[0], agentArray[1])
			print(agentregistry.agentRegistry[agentArray[1]]["ports"])
			globaldata.connectionDict["ports"] = agentregistry.agentRegistry[agentArray[1]]["ports"]
			echo("Found Agent " + agentArray[0] + " with address " + agentArray[1])
		"connect": 
			var targetMac: String = slicedCommand[1].to_upper()
			if targetMac == playerdata.playerInfoDict["playerMac"] or targetMac == "00:00:00:00:00:00":
				var connection = globaldata.connectionDict
				connection["hostname"] = playerdata.playerInfoDict["playerHostname"]
				connection["address"] = playerdata.playerInfoDict["playerMac"]
				connection["filesystem"] = playerdata.playerFs
				connection["ports"] = playerdata.playerPorts
			else:
				const connectMsg: String = "Connected to {hostname} @ {address}"
				if agentregistry.agentRegistry.has(targetMac):
					var connection = globaldata.connectionDict
					connection["hostname"] = agentregistry.agentRegistry[targetMac]["hostname"]
					connection["address"] = targetMac
					connection["filesystem"] = agentregistry.agentRegistry[targetMac]["filesystem"]
					connection["ports"] = {}
					for port in agentregistry.agentRegistry[targetMac]["ports"]:
						connection["ports"][port] = "unknown"
					echo(connectMsg.format({"hostname": connection["hostname"], "address": connection["address"]}))
				else:
					echo("Failed to connect: Could not find host at " + targetMac)
		"scan":
			if globaldata.connectionDict == {}:
				scanVicinity()
			elif agentregistry.agentRegistry[globaldata.connectionDict["address"]]["ports"][str(22)] == "closed" or "filtered":
				echo("Could not scan vicinity - Port 22 is closed")
			else:
				scanVicinity()
		"probe":
			const entry = "Port#: {port} | {state} | {service}"
			if globaldata.connectionDict != {}:
				var ports = globaldata.connectionDict["ports"].duplicate()
				echo("Port scan result for %s" % globaldata.connectionDict["hostname"])
				for port in ports:
					echo(entry.format({"port": str(port), "state": ports[port], "service": services[str(port)]}))
				echo("\nPort scan complete.")
			else:
				echo("Could not begin scan: You are not connected to a host.")
		"disconnect":
			var connection = globaldata.connectionDict
			connection = {}
			echo("Disconnected")
		"portanalyzer":
			if playerdata.playerStats["ramUsage"] + programs["portanalyzer"]["ramUsage"] > playerdata.playerStats["ramPool"]:
				echo("Failed to start Port Analyzer - Not enough memory available")
			elif playerdata.playerStats["operandUsage"] + programs["portanalyzer"]["operandUsage"] > playerdata.playerStats["operandPool"]:
				echo("Failed to start Port Analyzer - Not enough Operands available")
			else:
				spawnProgram.emit("portanalyzer")
		_:
			echo("No such command " + command + " - Check syntax and retry.")

func scanVicinity():
	for i in 5:
					rng.randomize()
					match rng.randi_range(0, 1):	# 0 hardcoded, 1 generated
						0:
							var agentKeys = agentregistry.hardAgents.keys()
							var chosenAgent = agentregistry.hardAgents[agentKeys.pick_random()]
							var agentHostname = globaldata.generateHostname(chosenAgent["sector"], chosenAgent["type"], chosenAgent["name"])
							if not agentregistry.agentRegistry.has(chosenAgent["address"]):
								agentregistry.registerAgent(chosenAgent["type"], 
								agentHostname,
								chosenAgent["address"],
								chosenAgent["ports"])
								echo(output.format({"hostname": agentHostname,
												"address": chosenAgent["address"]}))
							else:
								continue
						1:
							var agent: Array = globaldata.generateAgent(globaldata.currentSector, "generic")
							agentregistry.registerAgent("agent", agent[0], agent[1])
							echo(output.format({"hostname": agent[0], "address": agent[1]}))
