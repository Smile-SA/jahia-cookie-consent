<%@ include file="../../common/declarations.jspf" %>

<jcr:nodeProperty node="${currentNode}" name="buttonText" var="buttonText"/>
<jcr:nodeProperty node="${currentNode}" name="message" var="message"/>
<jcr:nodeProperty node="${currentNode}" name="knowMoreLink" var="knowMoreLink"/>
<jcr:nodeProperty node="${currentNode}" name="knowMoreLinkText" var="knowMoreLinkText"/>

<fmt:message key="snt_acceptCookiesMessage.buttonText.default" var="buttonTextDefault"/>
<fmt:message key="snt_acceptCookiesMessage.message.default" var="messageDefault"/>
<fmt:message key="snt_acceptCookiesMessage.knowMoreLinkText.default" var="knowMoreLinkTextDefault"/>

<c:set target="${moduleMap}" property="buttonText"
       value="${not empty buttonText ? buttonText.string : buttonTextDefault}"/>
<c:set target="${moduleMap}" property="message"
       value="${not empty message ? message.string : messageDefault}"/>
<c:set target="${moduleMap}" property="knowMoreLinkText"
       value="${not empty knowMoreLinkText ? knowMoreLinkText.string : knowMoreLinkTextDefault}"/>
<c:set target="${moduleMap}" property="knowMoreLink"
       value="${not empty knowMoreLink ? knowMoreLink.node : null}"/>
