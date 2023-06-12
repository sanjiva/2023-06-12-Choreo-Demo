import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
	label: "residents",
	id: "residents-a23be5f4-20ed-4902-b6bc-5183619cb5e4"
}
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
