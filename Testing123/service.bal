import ballerinax/googleapis.sheets;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Testing123",
    id: "Testing123-f1bbe94d-4de9-4c8b-9034-a77e02823bbe"
}
service / on new http:Listener(9090) {

    @display {
        label: "Google Sheets",
        id: "sheets-b3702b17-8fce-43d8-8fee-beef9256c096"
    }
    sheets:Client sheetsEp;

    function init() returns error? {
        self.sheetsEp = check new (config = {
            auth: {
                token: ""
            }
        });
    }

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
