<%@ include file="../../common/declarations.jspf" %>

<jcr:nodeProperty node="${currentNode}" name="buttonText" var="buttonText"/>
<jcr:nodeProperty node="${currentNode}" name="message" var="message"/>

<c:set target="${moduleMap}" property="knowMoreLink" value="${jcr:getChildrenOfType(currentNode,'jmix:link')}" />

<fmt:message key="snt_cookieConsentMessage.buttonText.default" var="buttonTextDefault"/>
<fmt:message key="snt_cookieConsentMessage.message.default" var="messageDefault"/>

<c:set target="${moduleMap}" property="buttonText"
       value="${not empty buttonText ? buttonText.string : buttonTextDefault}"/>
<c:set target="${moduleMap}" property="message"
       value="${not empty message ? message.string : messageDefault}"/>
