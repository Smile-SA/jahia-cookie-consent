<%@ include file="../../common/declarations.jspf" %>

<c:set var="isCookiesAccepted" value="${cookie['_accept_cookies'].value}"/>

<c:set var="cssEditMode" value="${isEditMode ? 'edit':''}" />

<c:if test="${not isCookiesAccepted or isEditMode}">

    <template:include view="hidden.setNodeProperties"/>

    <c:set var="message" value="${moduleMap.message}"/>
    <c:set var="buttonText" value="${moduleMap.buttonText}"/>
    <c:set var="dismissButtonText" value="${moduleMap.dismissButtonText}"/>
    <c:set var="cssDisplay" value="${moduleMap.display}" />

    <div class="cookieConsent alert alert-warning fade ${cssEditMode} ${cssDisplay}" role="alert">
        <div class="message">
            <c:out value="${message}" escapeXml="false" />
        </div>

        <div class="cookieConsent__buttons">
            <fmt:message key="label.accept" var="lAccept"/>
            <button type="button" class="accept" data-accept="alert" aria-label="${lAccept}">
                <span aria-hidden="true">${buttonText}</span>
            </button>
            <c:if test="${not empty dismissButtonText}">
                <fmt:message key="label.dismiss" var="lDismiss"/>
                <button type="button" class="dismiss" data-dismiss="alert" aria-label="${lDismiss}">
                    <span aria-hidden="true">${dismissButtonText}</span>
                </button>
            </c:if>
        </div>
    </div>

    <template:addResources type="css" resources="appConsent.css"/>
    <template:addResources type="javascript" resources="appConsent.js"/>

    <script>
        +function (appConsent) {
            appConsent.initializeConsentCookieButton();
        }(appConsent);
    </script>
</c:if>
