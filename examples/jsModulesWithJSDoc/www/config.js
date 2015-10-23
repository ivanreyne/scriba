var dojoConfig = {
    // loader configuration...
    baseUrl: "./",
    tlmSiblingOfDojo: false,
    packages: [
        {
            name: "dojo",
            location: "js/dojo"
        },
        {
            name: "app",
            location: "js_src/app"
        }
    ],
    deps: [
        "app/MainEntryPoint"
    ],
    callback: function () {
        // Require the application entry point module
        require(["dojo",
            "dojo/ready",
            "app/MainEntryPoint"],
                function (dojo, ready, EntryPoint) {
                    ready(function () {
                        var oEntry = new EntryPoint();
                        oEntry.loadApplication();
                    });
                });
    },
    parseOnLoad: false,
    async: true,
    locale: "en-uk",
    has: {
    }
};