/*global cordova, module*/

module.exports = {
    saveValue: function (key, value, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "MBUserDefaults", "saveValue", [key, value]);
    },
    saveValueToAppGroup: function (key, value, appGroup, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "MBUserDefaults", "saveValueToAppGroup", [key, value, appGroup]);
    },
    getValue: function (key, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "MBUserDefaults", "getValue", [key]);
    },
    getValueFromAppGroup: function (key, appGroup, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "MBUserDefaults", "getValueFromAppGroup", [key, appGroup]);
    }
};
