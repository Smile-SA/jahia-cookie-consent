<%@ include file="../../common/declarations.jspf" %>

<c:set var="isCookiesAccepted" value="${cookie['_accept_cookies'].value}"/>

<c:set var="cssClass" value="${isEditMode ? 'edit':''}" />

<c:if test="${not isCookiesAccepted or isEditMode}">

    <template:include view="hidden.setNodeProperties"/>

    <c:set var="message" value="${moduleMap.message}"/>
    <c:set var="knowMoreLink" value="${moduleMap.knowMoreLink}"/>
    <c:set var="knowMoreLinkText" value="${moduleMap.knowMoreLinkText}"/>
    <c:set var="buttonText" value="${moduleMap.buttonText}"/>

    <div id="cookieMessage" class="alert alert-warning alert-dismissible fade ${cssClass}" role="alert">
        <fmt:message key="label.dismiss" var="lDismiss"/>
        <button type="button" class="close" data-dismiss="alert" aria-label="${lDismiss}">
            <span aria-hidden="true">${buttonText}</span>
        </button>

        <div class="message">
            <c:out value="${message} " />
        </div>

        <c:if test="${not empty knowMoreLink}">
            <div class="knowMoreLink">
                <template:module node="${knowMoreLink[0]}" />
            </div>
        </c:if>

        <c:if test="${empty knowMoreLink}">
            <div class="knowMoreLink">
                <div style="margin-top: 20px;">
                    <template:module path="*" nodeTypes="jnt:externalLink jnt:nodeLink" />
                </div>
            </div>
        </c:if>

    </div>

    <template:addResources type="css" resources="app.css"/>
    <template:addResources type="javascript" resources="app.js"/>
</c:if>
