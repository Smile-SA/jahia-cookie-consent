<%@include file="../../common/declarations.jspf"%>

<%@include file="acceptCookieBar.hidden.nodeData.jsp"%>

<c:set var="isCookieAccepted" value="${cookie['accept_cookie'].value}" />

<c:if test="${not isCookieAccepted or isEditMode}">

    <div id="accept_cookie" class="alert alert-warning alert-dismissible fade" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">
            ${acceptCookieButton}
        </span>
        </button>
        ${message}

        <c:if test="${not empty knowMoreLink}">
             <span>
                <a href="${knowMoreLink.url}">
                    ${knowMoreLinkText}
                </a>
            </span>
        </c:if>

    </div>

    <template:addResources type="css" resources="${url.currentModule}/css/jnt_acceptCookieBar.css" />
    <template:addResources type="javascript" resources="${url.currentModule}/javascript/jnt_acceptCookieBar.js" />
</c:if>

