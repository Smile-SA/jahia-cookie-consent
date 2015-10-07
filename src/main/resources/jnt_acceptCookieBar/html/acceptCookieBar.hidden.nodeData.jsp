<jcr:nodeProperty node="${currentNode}" name="acceptCookieButton" var="acceptCookieButton"/>
<jcr:nodeProperty node="${currentNode}" name="message" var="message"/>
<jcr:nodeProperty node="${currentNode}" name="knowMoreLink" var="knowMoreLink"/>
<jcr:nodeProperty node="${currentNode}" name="knowMoreLinkText" var="knowMoreLinkText"/>

<fmt:message key="jnt_acceptCookieBar.acceptCookieButton.value.default" var="acceptCookieButtonDefault" />
<fmt:message key="jnt_acceptCookieBar.message.value.default" var="messageDefault"/>
<fmt:message key="jnt_acceptCookieBar.knowMoreLinkText.value.default" var="knowMoreLinkTextDefault"/>

<c:set var="acceptCookieButton" value="${not empty acceptCookieButton? acceptCookieButton.string: acceptCookieButtonDefault}" />
<c:set var="message" value="${not empty message? message.string: messageDefault}" />
<c:set var="knowMoreLink" value="${not empty knowMoreLink? knowMoreLink.node: null}" />
<c:set var="knowMoreLinkText" value="${not empty knowMoreLinkText? knowMoreLinkText.string: knowMoreLinkTextDefault}" />