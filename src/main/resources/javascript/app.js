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
    * Hide cookie consent, remove body padding and remove event listener
    */
    var hide = function () {
        var cookieConsentList = document.querySelectorAll(".cookieConsent");

        for (var i = 0; i < cookieConsentList.length; i++) {
            var cookieConsent = cookieConsentList[i];
            cookieConsent.classList.add("hide");
            document.body.style.paddingTop = "";
            document.body.style.paddingBottom = "";
            window.removeEventListener("resize", addBodyPadding, true)
        }
    };

    /**
     * When click on dismiss button, hide cookie consent.
     * When click on accept button, set a cookie and hide cookie consent.
     */
    var initializeButtonClicks = function () {
        var cookieConsentAcceptList = document.querySelectorAll(".cookieConsent .accept");
        for (var i = 0; i < cookieConsentAcceptList.length; i++) {
            var cookieConsentAccept = cookieConsentAcceptList[i];
            cookieConsentAccept.onclick = function() {
                setCookieForOneYear("_accept_cookies", "true");
                hide();
            };
        }
        var cookieConsentDismissList = document.querySelectorAll(".cookieConsent .dismiss");
        for (var i = 0; i < cookieConsentDismissList.length; i++) {
            var cookieConsentDismiss = cookieConsentDismissList[i];
            if (cookieConsentDismiss) {
                cookieConsentDismiss.onclick = function() {
                    hide();
                };
            }
        }
    };

    /**
    * Add top or bottom padding to the body when using fixed positioning
    */
    var addBodyPadding = function () {
        var cookieConsentFixedTop = document.querySelector(".cookieConsent.fixedTop");
        if (cookieConsentFixedTop) {
            document.body.style.paddingTop = cookieConsentFixedTop.offsetHeight + "px";
        }
        var cookieConsentFixedBottom = document.querySelector(".cookieConsent.fixedBottom");
        if (cookieConsentFixedBottom) {
            document.body.style.paddingBottom = cookieConsentFixedBottom.offsetHeight + "px";
        }
    };

    /**
    * Initializes body padding (with window resize handling)
    */
    var initializeBodyPadding = function () {
        addBodyPadding();
        window.addEventListener("resize", addBodyPadding, true);
    };

    app.initializeConsentCookieButton = function () {
        initializeButtonClicks();
        initializeBodyPadding();
    };

    return app;
}(app || {}));
