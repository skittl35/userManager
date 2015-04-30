<cfcomponent extends="Controller">

	<cffunction name="create">
		<cfif isdefined("session.loggedIn") AND session.loggedIn EQ 1>
			<cfset user = model("user").create(params.user)>

			<cfset redirectTo(
				action="index",
				success="User #user.name# created successfully.")>
		<cfelse>
			<cfset redirectTo(action="login")>
		</cfif>
	</cffunction>

	<cffunction name="index">
		<cfif isdefined("session.loggedIn") AND session.loggedIn EQ 1>
			<cfif isdefined("params.pageNum")>
				<cfset pageNum = #params.pageNum#>
			<cfelse>
				<cfset pageNum = 1>
			</cfif>

			<cfset allUsers = model("user").findAll()> <!--- For calculating last page --->
			<cfset users = model("user").findAll(order="name", page=#pageNum#, perPage=5)>
			<cfset user = model("user").new()> <!--- Create Modal requires this --->
			<cfset roles = model("role").findAll(order="roleName")>
			<cfset states = model("state").findAll(order="fullName")>
			<cfset success = "">

			<cfset lastPage = ceiling(#allusers.recordcount#/5)>

			<!--- Define what numbers appear in the pagination boxes --->
			<cfif pageNum EQ 1>
				<cfset boxOneNum = 1>
				<cfset boxTwoNum = 2>
				<cfset boxThreeNum = 3>
			<cfelseif pageNum EQ lastPage>
				<cfset boxOneNum = lastPage-2>
				<cfset boxTwoNum = lastPage-1>
				<cfset boxThreeNum = lastPage>
			<cfelse>
				<cfset boxOneNum = pageNum-1>
				<cfset boxTwoNum = pageNum>
				<cfset boxThreeNum = pageNum+1>
			</cfif>

		<cfelse>
			<cfset redirectTo(action="login")>
		</cfif>
	</cffunction>	

	<cffunction name="edit">
		<cfset user = model("user").findByKey(params.key)>
		<cfset states = model("state").findAll(order="fullName")>
		<cfset roles = model("role").findAll(order="roleName")>
	</cffunction>

	<cffunction name="update">
		<cfif isdefined("session.loggedIn") AND session.loggedIn EQ 1>
			<cfdump var="#params#">
			<cfset user = model("user").findByKey(params.user.id)>
			<cfset user.update(params.user)>
			<cfset redirectTo(
				action="index",
				key=user.id,
				success="User #user.name# updated successfully.")>
		<cfelse>
			<cfset redirectTo(action="login")>
		</cfif>
	</cffunction>

	<cffunction name="delete">
		<cfif isdefined("session.loggedIn") AND session.loggedIn EQ 1>
			<cfset user = model("user").findByKey(params.deleteID)>
			<cfset user.delete()>
			<cfset redirectTo(
				action="index",
				success="#user.name# was successfully deleted.")>
		<cfelse>
			<cfset redirectTo(action="login")>
		</cfif>
	</cffunction>





	<cffunction name="login">
		<!--- nothing needed --->
	</cffunction>

	<cffunction name="loginAction">
		<cfset emailValid="Yes">
		<cfset passwordValid="Yes">

		<cfset userEmail = model("user").findOneByEmail("#params.email#")>

		<cfif isdefined("userEmail.id")>
			<cfset userPassword = model("user").findOneByuserPassword("#params.password#")>

			<cfif isdefined("userPassword.id")>
				<cfset user = model("user").findOneByEmailAndUserPassword("#params.email#,#params.password#")>

				<cfset session.loggedIn = "1">
				<cfset session.userRole = "#user.roleID#">
				<cfset session.userID = "#user.id#">

				<cfset redirectTo(action="index")>
			<cfelse>
				<cfset passwordValid="No">
				<cfset redirectTo(action="login", params="emailValid=#emailValid#&passwordValid=#passwordValid#")>
			</cfif>
		<cfelse>
			<cfset emailValid="No">
			<cfset passwordValid="No">
			<cfset redirectTo(action="login", params="emailValid=#emailValid#&passwordValid=#passwordValid#")>
		</cfif>
	</cffunction>

	<cffunction name="logout">
		<cfset session.loggedIn = "0">
		<cfset session.userRole = "0">
		<cfset session.userID = "0">

		<cfset redirectTo(action="login")>
	</cffunction>




	<!--- For demonstration of old index w/ edit modal --->
	<cffunction name="oldIndex">
		<cfif isdefined("session.loggedIn") AND session.loggedIn EQ 1>

			<cfset users = model("user").findAll(order="name")>
			<cfset user = model("user").new()>
			<cfset roles = model("role").findAll(order="roleName")>
			<cfset states = model("state").findAll(order="fullName")>
			<cfset success = "">
		<cfelse>
			<cfset redirectTo(action="login")>
		</cfif>
	</cffunction>

</cfcomponent>