/**
 * Copyright 2017 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [START container_hello_app]
package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
//	"time"
)

func main() {
	// register hello function to handle all requests
	mux := http.NewServeMux()
	mux.HandleFunc("/", hello)

	// use PORT environment variable, or default to 8080
	port := os.Getenv("PORT")
	if port == "" {
		port = "80"
	}

	// start the web server on port and accept requests
	log.Printf("Server listening on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, mux))
}

// hello responds to the request with a plain-text "Hello, world" message.
func hello(w http.ResponseWriter, r *http.Request) {
	log.Printf("Serving request: %s %s", r.RemoteAddr, r.URL.Path)
	host, _ := os.Hostname()
	node := os.Getenv("MY_NODE_NAME")
	podip := os.Getenv("MY_POD_IP")
//	time.Sleep(time.Second)
	remoteip, remoteport, httperror := net.SplitHostPort(r.RemoteAddr)
	if httperror == nil {
	//fmt.Fprintf(w, "Running_node: %s\tServing_POD_ip: %s\tRequesting_IP: %s\tServing_hostname: %s\n", node, podip, r.RemoteAddr, host)
		fmt.Fprintf(w, "%s\t%s\t%s\t%s\t%s\n", node, podip, remoteip, remoteport, host)
	}
}

// [END container_hello_app]
