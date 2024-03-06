extends Node

func instanceNodeAtLocation(node: Object, parent: Object, location: Vector3):
	var node_instance = node.instance()
	node_instance.translation = location
	parent.add_child(node_instance)
	return node_instance
	
func instanceNode(node: Object, parent: Object):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	return node_instance
