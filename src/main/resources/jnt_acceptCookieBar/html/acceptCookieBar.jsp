<%@ include file="../../common/declarations.jspf" %>

<template:include view="hidden.setNodeProperties" />

<c:set var="isCookiesAccepted" value="${cookie['_accept_cookie'].value}" />

<c:if test="${not isCookiesAccepted or isEditMode}">
    <div id="cookieMessage" class="alert alert-warning alert-dismissible fade" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">
            ${acceptCookieButton}
        </span>
        </button>
        ${message}

        <c:if test="${not empty knowMoreLink}">
             <span>
                <a href="${knowMoreLink.url}" title="">
                    ${knowMoreLinkText}
                </a>
            </span>
        </c:if>
    </div>

    <template:addResources type="css" resources="app.cookies.css" />
    <template:addResources type="javascript" resources="app.cookies.js" />
</c:if>