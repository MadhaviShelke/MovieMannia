<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	function deleteTheater(id) {
		var x = confirm("Are you sure you want to delete?");
		if (x) {
			document.getElementById("id").value = id;
			document.getElementById('userForm').action = "deleteUser";
			document.getElementById('userForm').submit();
		} else {
			return false;
		}
	}
	function editUser(id,cityId,cityName) {
		 document.getElementById("updateDiv").style.display='block';
		    var form=document.getElementById("cityUpdateForm");
		    form.id.value = id;
		    form.cityId.value = cityId;
		    form.cityName.value = cityName;
	}
	function addTheater() {
		resetTheater();
	    document.getElementById("addDiv").style.display='block';
	    document.getElementById("updateDiv").style.display='none';
}
  
	function resetTheater(){
		var form=document.getElementById("theaterForm");
	    form.theaterCode.value = '';
	    form.theaterName.value = '';
	    form.theaterAddress.value = '';
	    form.theaterEmail.value = '';
	    form.theaterPhone.value = '';
	}
	
	
</script>

<div id="content" style="background-color: #fff; height: 700px">
	<div id="addDiv" align="center" style="margin-top: 10%; display: none">
		<s:form id="theaterForm" action="addTheater">
			<s:hidden key="id" id="id" value="" />
			<s:textfield name="theaterCode" label="Theater Code"></s:textfield>
			<s:textfield name="theaterName" label="Theater Name "></s:textfield>
			<s:select label="City"  name="city" list="cityList" listKey="cityId" listValue="cityName" />
			<s:textfield name="theaterAddress" label="Theater Address"></s:textfield>
			<s:textfield name="theaterEmail" label="Theater Email "></s:textfield>
			<s:textfield name="theaterPhone" label="Theater Phone"></s:textfield>
			<s:submit value="Submit"></s:submit>
		</s:form>
	</div>

	<div id="updateDiv" align="center"
		style="margin-top: 10%; display: none">
		<s:form id="cityUpdateForm" action="updateCity">
			<s:hidden key="id" id="id" />
			<s:textfield name="cityId" label="cityId"></s:textfield>
			<s:textfield name="cityName" label="City Name "></s:textfield>
			<s:submit value="Submit" label="Update"></s:submit>
		</s:form>
	</div>

<div>
	<s:form id="searchForm" action="searchTheater">
	<s:select label="City"  name="city" list="cityList" listKey="cityId" listValue="cityName" />
	<s:submit value="Submit"></s:submit>
	</s:form>
	<div>
	




	<div id="addformDiv" style="margin-top: 10%; margin-left: 16%">
		<img src="images/add.png" longdesc="Add Theater" width="25px"
			onclick="addTheater()" align="top" height="25px"> <span
			style="font-weight: bold; font-size: 15px;">Add Theater</span>
	</div>
	
	
	</div>
	<div id="formDiv" align="center" style="margin-top: 1%">
		<table border="1" width="500px">
			<tr>
				<td>Theater Code</td>
				<td>Theater Name</td>
				<td>Theater Address</td>
				<td>Theater Phone</td>
				<td>update</td>
				<td>delete</td>
			</tr>

			<s:iterator value="theaterList">
				<tr>
					<td><s:property value="theaterCode" /></td>
					<td><s:property value="theaterName" /></td>
					<td><s:property value="theaterAddress" /></td>
					<td><s:property value="theaterPhone" /></td>
					<td><img src="images/edit.png"
						onclick="editUser('<s:property value="id"/>','<s:property value="theaterCode"/>','<s:property value="theaterName"/>')"
						width="25px" height="25px"></td>
					<td><img src="images/delete.png" width="25px"
						onclick="deleteTheater('<s:property value="id"/>')" height="25px"></td>
				</tr>
			</s:iterator>
		</table>
	</div>
</div>
