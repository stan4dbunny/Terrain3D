@tool
extends EditorExportPlugin

var _hash: String


func _get_name() -> String:
	return "Terrain3DExportPlugin"


func _begin_customize_resources(platform: EditorExportPlatform, features: PackedStringArray) -> bool:
	_hash = ""
	for feat: String in features:
		_hash += feat
	_hash += platform.to_string()
	return true
	
	
func _customize_resource(resource: Resource, path: String) -> Resource:
	var _region: Terrain3DRegion
	if resource is Terrain3DRegion:
		_region = resource
		if _region.compressed_color_map != null:
			_region.free_uncompressed_color_map()
			return _region
	return null
	
	
func _get_customization_configuration_hash() -> int:
	return hash(_hash)
	
