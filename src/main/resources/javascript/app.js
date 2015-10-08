var app = (function (app, undefined) {
  "use strict";

  // Cookies namespace
  app.cookies = app.cookies || {};


  var jQueryScriptOutputted = false;
  function initJQuery() {
    //if the jQuery object isn't available
    if (typeof(jQuery) == 'undefined') {

      if (! jQueryScriptOutputted) {
        jQueryScriptOutputted = true;
        document.write("<scr" + "ipt type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></scr" + "ipt>");
      }
      setTimeout("initJQuery()", 50);
    }
  }


  initJQuery();

  // Deal with possible jQuery conflicts
  var $ = app.$ || $;


  /**
   * Set cookie for X days
   *
   * @param expiresInDays Number of days
   * @returns {setCookie} Set cookie for the current domain
   */
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
   * Set cookie which allow setting other cookies for current domain for one year
   */
  var setAcceptCookie = function () {
    setCookieForOneYear("_accept_cookies", "true");
  };

  // Expose API
  app.cookies.setAcceptCookie = setAcceptCookie;

  $(function () {
    // Let overriding $elm value
    var $elm = app.cookies.$elm || $("#cookiesMessage .close");
    // Set cookie for current domain when user dismisses legal information
    $elm.on("click", setAcceptCookie);
  });

  return app;
}(app || {}));
