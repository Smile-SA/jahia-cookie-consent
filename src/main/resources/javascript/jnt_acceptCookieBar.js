(function () {
    $(function() {

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + "; " + expires +";  path=/";
        }

        $('#accept_cookie .close').click(function() {
            setCookie("accept_cookie", "true", 365);
        });
    });
})();