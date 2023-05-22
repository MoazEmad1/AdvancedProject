(function (global) {
    // Check if the global object is defined (in this case, the window object)
    if (typeof (global) === "undefined") {
        // Throw an error if the global object is undefined
        throw new Error("window is undefined");
    }

    // Define a private variable for the hash value
    var _hash = "!";

    // Define a function called noBackPlease
    var noBackPlease = function () {
        // Append a hash to the current URL
        global.location.href += "#";

        // Wait for a short period of time and append another hash to the URL
        // This is done to ensure that the hash is always present in the URL
        global.setTimeout(function () {
            global.location.href += "!";
        }, 50);
    };

    // Listen for the onhashchange event, which fires when the hash in the URL changes
    global.onhashchange = function () {
        // If the hash in the URL is not equal to the private hash value
        if (global.location.hash !== _hash) {
            // Set the hash in the URL to the private hash value
            global.location.hash = _hash;
        }
    };

    // Listen for the onload event, which fires when the page finishes loading
    global.onload = function () {
        // Call the noBackPlease function to ensure the hash is always present in the URL
        noBackPlease();

        // Disable the backspace key on the page, except for input fields and textareas
        document.body.onkeydown = function (e) {
            var elm = e.target.nodeName.toLowerCase();
            // If the pressed key is the backspace key and the target element is not an input or textarea
            if (e.which === 8 && (elm !== 'input' && elm !== 'textarea')) {
                // Prevent the default backspace behavior (e.g., navigating back in history)
                e.preventDefault();
            }
            // Stop the event from bubbling up the DOM tree
            e.stopPropagation();
        };
    }
})(window);
