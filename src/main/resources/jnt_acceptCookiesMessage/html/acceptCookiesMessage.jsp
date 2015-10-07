<%@ include file="../../common/declarations.jspf" %>

<c:set var="isCookiesAccepted" value="${cookie['_accept_cookies'].value}"/>

<c:if test="${not isCookiesAccepted or isEditMode}">

    <template:include view="hidden.setNodeProperties"/>

    <c:set var="message" value="${moduleMap.message}"/>
    <c:set var="knowMoreLink" value="${moduleMap.knowMoreLink}"/>
    <c:set var="knowMoreLinkText" value="${moduleMap.knowMoreLinkText}"/>
    <c:set var="buttonText" value="${moduleMap.buttonText}"/>

    <div id="cookiesMessage" class="alert alert-warning alert-dismissible fade" role="alert">
        <fmt:message key="label.dismiss" var="lDismiss"/>
        <button type="button" class="close" data-dismiss="alert" aria-label="${lDismiss}">
            <span aria-hidden="true">${buttonText}</span>
        </button>

        ${message}

        <c:if test="${not empty knowMoreLink and not empty knowMoreLinkText}">
            <c:url var="knowMoreLinkUrl" value="${knowMoreLink.url}"/>
            <a href="${knowMoreLinkUrl}"
               title="${knowMoreLinkText}"
            >${knowMoreLinkText}</a>
        </c:if>
    </div>

    <template:addResources type="css" resources="app.css"/>
    <template:addResources type="javascript" resources="app.js"/>
</c:if>
