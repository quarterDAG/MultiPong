extends Control

var webApiKey = "AIzaSyA21lf4M28hao9CSyA0MkDcNG4QD_DV4CA"
var signupUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key="
var loginUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="

func _loginSignup(url: String, email: String, password: String):
	var http = $HTTPRequest
	var jsonObject = JSON.new()
	var body = jsonObject.stringify({'email' : email, 'password' : password})
	var headers = ['Content-Type: application/json']
	var error = await http.request(url, headers, HTTPClient.METHOD_POST, body)
	
# , HTTPClient.METHOD_POST, body

func _on_http_request_request_completed(result, response_code, headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	if(response_code == 200):
		print(response)
		get_tree().change_scene_to_file("res://Scenes/Main Scenes/Main_Scene.tscn")
	else:
		print(response.error)
		$"../Error Label".text = response.error.message


func _on_sign_up_pressed():
	var url = signupUrl + webApiKey
	var email = $"../Email".text
	var password = $"../Password".text
	_loginSignup(url, email, password)

func _on_login_pressed():
	var url = loginUrl + webApiKey
	var email = $"../Email".text
	var password = $"../Password".text
	_loginSignup(url, email, password)
