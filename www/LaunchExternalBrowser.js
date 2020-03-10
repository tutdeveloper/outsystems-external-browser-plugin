var exec = require('cordova/exec');

exports.openExternalBrowser = function(siteURL, success, error) {
    exec(success, error, "LaunchExternalBrowser", "openExternalBrowser", [siteURL]);
};
