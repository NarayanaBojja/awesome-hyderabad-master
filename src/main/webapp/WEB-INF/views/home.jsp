<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Awesome Hyderabad | Home</title>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/logo.jpg">
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function loadPage (){
var e=document.getElementById("refreshed");
if(e.value=="no")e.value="yes";
else{e.value="no";location.reload();}
}
</script>
</head>
<body onload="loadPage">
	<jsp:include page="header.jsp"></jsp:include>
	<img alt="" src="resources/images/hyderabad.png"
		style="height: 600px; width: 50%;">

<div style="margin-top: -614px;
    margin-left: 730px; font-family: cursive;">
<p>
Hyderabad  is the capital of the  Telangana state. Occupying 650 square kilometres (250 sq mi) along the banks of the Musi River, it has a population of about 6.7 million and a metropolitan population of about 7.75 million, making it the fourth most populous city and sixth most populous urban agglomeration in India.
</p>
<p>Established in 1591 by Muhammad Quli Qutb Shah, Hyderabad remained under the rule of the Qutb Shahi dynasty for nearly a century before the Mughals captured the region. In 1724, Mughal viceroy Asif Jah I declared his sovereignty and created his own dynasty, known as the Nizams of Hyderabad. The Nizam's dominions became a princely state during the British Raj, and remained so for 150 years, with the city serving as its capital. The city continued as the capital of Hyderabad State after it was brought into the Indian Union in 1948, and became the capital of Andhra Pradesh after the States Reorganisation Act, 1956. Since 1956, Rashtrapati Nilayam in the city has been the winter office of the President of India. In 2014, the newly formed state of Telangana split from Andhra Pradesh and the city became joint capital of the two states, a transitional arrangement scheduled to end by 2025.</p>
<p>Relics of Qutb Shahi and Nizam rule remain visible today; the Charminar—commissioned by Muhammad Quli Qutb Shah—has come to symbolise Hyderabad. Golconda fort is another major landmark. The influence of Mughlai culture is also evident in the region's distinctive cuisine, which includes Hyderabadi biryani and Hyderabadi haleem. The Qutb Shahis and Nizams established Hyderabad as a cultural hub, attracting men of letters from different parts of the world. Hyderabad emerged as the foremost centre of culture in India with the decline of the Mughal Empire in the mid-19th century, with artists migrating to the city from the rest of the Indian subcontinent.</p>
<p>Hyderabad was historically known as a pearl and diamond trading centre, and it continues to be known as the City of Pearls. Many of the city's traditional bazaars remain open, including Laad Bazaar, Begum Bazaar and Sultan Bazaar. Industrialisation throughout the 20th century attracted major Indian manufacturing, research and financial institutions, including Bharat Heavy Electricals Limited, the National Geophysical Research Institute and the Centre for Cellular and Molecular Biology. Special economic zones dedicated to information technology have encouraged companies from India and around the world to set up operations in Hyderabad. The emergence of pharmaceutical and biotechnology industries in the 1990s led to the area's naming as India's "Genome Valley". With an output of US$74 billion, Hyderabad is the fifth-largest contributor to India's overall gross domestic product.</p>


</div>
<input type="hidden" id="refreshed" value="no">
	<jsp:include page="footer.jsp" />
</body>
</html>