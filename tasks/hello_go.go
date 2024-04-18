// to build this for linux i386, do
// GOOS=linux GOARCH=386 go build -o hello_go tasks/hello_go_linux_i386
// to build this for windows i386, do
// GOOS=windows GOARCH=386 go build -o hello_go tasks/hello_go_windows_i386.exe
//
// To let Bolt know what target has what architecture you need to add `features`` to inventory
// like this:
//
// - name: windows
// targets:
// 	- win.target.vm
// config:
// 	transport: winrm
// 	winrm:
// 		user: Administrator
// 		password: my_pwd
// features:
// 	- windows_i386
//
// - name: linux
// targets:
// 	- lin.target.vm
// config:
// 	transport: ssh
// 	ssh:
// 		user: root
// 		password: my_pwd
// features:
// 	- linux_i386
//
// Subsequently, the task metadata file can use these features as
// requirements in its implementations section like this:
//
// "implementations": [
// 	{
// 		"name": "hello_go_linux_i386",
// 		"requirements": ["linux_i386"]
// 	},
// 	{
// 		"name": "hello_go_windows_i386.exe",
// 		"requirements": ["windows_i386"]
// 	}
// ]

package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
)

func main() {
	var params map[string]interface{}

	// Read STDIN
	data, err := io.ReadAll(os.Stdin)
	if err != nil {
		fmt.Println("Failed to read STDIN:", err)
		return
	}

	// Parse JSON
	err = json.Unmarshal(data, &params)
	if err != nil {
		fmt.Println("Failed to parse JSON:", err)
		return
	}

	message := params["message"].(string)
	fmt.Println("Hello, " + message + "!")
}
