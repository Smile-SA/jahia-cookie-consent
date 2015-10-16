var app = (function (app, undefined) {
    "use strict";

    var setCookieForXDays = function (expiresInDays) {

        /**
         * Set cookie for X days for the current domain
         *
         * @param cookieName Cookie name to set
         * @param cookieValue Cookie value to set
         */
        var setCookie = function (cookieName, cookieValue) {
            var date = new Date();
            date.setTime(date.getTime() + (expiresInDays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + date.toUTCString();
            document.cookie = cookieName + "=" + cookieValue + "; " + expires + ";  path=/";
        };

        return setCookie;
    };

    /**
     * Shortcut to set a cookie for one year
     */
    var setCookieForOneYear = setCookieForXDays(365);

    /**
     * When click on accept button, set a cookie
     */
    app.initializeConsentCookieButton = function () {
        document.querySelector("#cookieMessage .close").onclick = function(){
            setCookieForOneYear("_accept_cookies", "true");
            document.querySelector("#cookieMessage").style.display = "none";
        };
    };

    return app;
}(app || {}));
