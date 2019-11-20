<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	<acme:form-integer code="administrator.dashboard.form.label.numberAnnouncement" path="numberAnnouncement"/>
	<acme:form-integer code="administrator.dashboard.form.label.numberCompanyRecords" path="numberCompanyRecords"/>
	<acme:form-integer code="administrator.dashboard.form.label.numberInvestorRecords" path="numberInvestorRecord"/>
	<acme:form-money code="administrator.dashboard.form.label.minimunRewardOffer" path="minimunRewardOffer"/>
	<acme:form-money code="administrator.dashboard.form.label.maximunRewardOffer" path="maximunRewardOffer"/>
	<acme:form-money code="administrator.dashboard.form.label.averageRewardOffer" path="averageRewardOffer"/>
	<acme:form-money code="administrator.dashboard.form.label.stdOffer" path="stdOffer"/>
	<acme:form-money code="administrator.dashboard.form.label.minimunRewardRequest" path="minimunRewardRequest"/>
	<acme:form-money code="administrator.dashboard.form.label.maximunRewardRequest" path="maximunRewardRequest"/>
	<acme:form-money code="administrator.dashboard.form.label.averageRewardRequest" path="averageRewardRequest"/>
	<acme:form-money code="administrator.dashboard.form.label.stdRequest" path="stdRequest"/>
</acme:form>

<div>
	<canvas id="canvas"></canvas>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var data = {
				labels : [
					<jstl:choose>
						<jstl:when test="${gridLabels} == null">
							""
						</jstl:when>
						<jstl:otherwise>
							<jstl:forEach var="item" items="${gridLabels}">
								<jstl:out value="\"${item}\"" escapeXml="false"/>,
							</jstl:forEach>						
						</jstl:otherwise>
					</jstl:choose>
				],
				datasets : [
					{
						label : "Investor Records",
						backgroundColor : "rgba(22, 38, 212, 0.3)",
						borderColor : "rgba(22, 38, 212, 1)",
						data : [
							
							<jstl:choose>
								<jstl:when test="${dataInvestor} == null">
									""
								</jstl:when>
								<jstl:otherwise>
									<jstl:forEach var="item" items="${dataInvestor}">
										<jstl:out value="\"${item}\"" escapeXml="false"/>,
									</jstl:forEach>				
								</jstl:otherwise>
							</jstl:choose>							
							
						]
					},{
						label : "Company Records",
						backgroundColor : "rgba(19, 157, 16, 0.3)",
						borderColor : "rgba(19, 157, 16, 1)",
						data : [
							
								<jstl:choose>
									<jstl:when test="${dataCompany} == null">
										""
									</jstl:when>
									<jstl:otherwise>
										<jstl:forEach var="item" items="${dataCompany}">
											<jstl:out value="\"${item}\"" escapeXml="false"/>,
										</jstl:forEach>				
									</jstl:otherwise>
								</jstl:choose>							
						]
					}
				]
		};
		var options = {
			scales : {
				yAxes : [
					{
						ticks : {
							min : 0,
							stepSize : 1,
							autoSkip : true
						}
					}
				]
			},
			legend : {
				display : true
			}
		};
		
		var canvas, context;
		
		canvas = document.getElementById("canvas");
		context = canvas.getContext("2d");
		new Chart(context, {
			type : "bar",
			data : data,
			options : options
		});
	});
</script>