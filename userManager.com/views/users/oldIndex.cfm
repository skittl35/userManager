<cfinclude template="_header.cfm">



<script type="text/javascript">
	$(function(){
	    $('#updateModal').modal({
	        keyboard: true,
	        backdrop: "static",
	        show:false,

	    }).on('show', function(){ //subscribe to show method
	          var getIdFromRow = $(event.target).closest('tr').data('userID'); //get the id from tr
	          alert(getIdFromRow);
	          window.alert('wtf');
	          console.log('wtf');
	        //make your ajax call populate items or what even you need
	        $(this).find('#hiddenUserID').val = getIdFromRow
	    });
	});
</script>

<div class="content">
	<div class="mainbar" style="margin-left:0px; min-height:300px;">
		<div class="page-head">
			<h2 class="pull-left">User Listing</h2>
        	<div class="clearfix"></div>
        
        	<!-- Breadcrumb -->
        	<div class="bread-crumb">
          		<a href="index.html"><i class="fa fa-home"></i> Home</a> 
          
          		<div class="pull-right">
          			<cfoutput>#linkTo(text="Logout", action="logout", title="Logout")#</cfoutput>
          		</div>
          		<!-- Divider -->
          		<span class="divider">/</span> 
          		<a href="#" class="bread-current">User Listing</a>
        	</div>
        	<div class="clearfix"></div>
	    </div>

	    <div class="matter">
	    	<div class="container">
	    		<div class="row">
	    			<div class="col-md-12">
	    				<div class="widget">
	    					<div class="widget-head">
	    						<div class="pull-left">Tables</div>
	    						<div class="widget-icons pull-right">
		    						<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
				                    <a href="#" class="wsettings"><i class="fa fa-wrench"></i></a>  
				                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
				                </div>
				                <div class="clearfix"></div>
				            </div>
				            
				            <div class="widget-content">
				            	<div class="padd">
				            		<!--- content here --->
				            		<table class="table table-striped table-bordered table-hover">
                    					<thead>
                        					<tr>
                        						<th>Name</th>
                        						<th>Address</th>
                        						<th>Phone</th>
                        						<th>Email</th>
                        						<th>Role</th>
                        						<!---<th>Action</th>--->
                        					</tr>
                    					</thead>
                    					<tbody>
                    						<cfoutput query="users">
	                        					
	                        					<cfif isdefined("session.userRole") AND session.userRole EQ "1">
	                        						<tr data-toggle="modal" data-userID="#users.id#" data-target="##updateModal" class="modalTR">
	                        					<cfelseif isdefined("session.userID") AND session.userID EQ users.id>
	                        						<tr data-toggle="modal" data-userID="#users.id#" data-target="##updateModal" class="modalTR">
	                        					<cfelse>
	                        						<tr>
	                        					</cfif>
	                        					
	                        					

	                        						<td>#users.name#</td>
	                        						<td>
	                        							#users.userAddress#<br />
	                        							#users.userCity#, #users.userState#, #users.userZip#
	                        						</td>
	                        						<td>#users.phoneNumber#</td>
	                        						<td>#users.email#</td>
	                        						<td>
	                        							<cfif users.roleID EQ 1>
	                        								<span class="label label-success">Administrator</span>
	                        							<cfelse>
	                        								<span class="label label-info">Read Only</span>
	                        							</cfif>
	                        						</td>
	                        						<!---<td>
														<cfif isdefined("session.userRole") AND session.userRole EQ 1>
	                        								#linkTo(text="Delete", action="delete", title="Delete", params="deleteID=#users.id#")#
	                        							<cfelseif users.id EQ session.userID>
	                        								<span class="label label-info">Read Only</span>
	                        							</cfif>
	                        						</td>--->
	                        					</tr>
	                        				</cfoutput>                                                         
                    					</tbody>
                    				</table>

                    				<div id="createModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            							<div class="modal-dialog">
            					  			<div class="modal-content">
                                  				<div class="modal-header">
                                    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    				<h4 class="modal-title">Create User</h4>
                                  				</div>

                                    			<cfoutput>

													#startFormTag(action="create", class="form-horizontal")#
	                                  				<div class="modal-body">
														#textField(objectName="user", property="name", label="Name", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textField(objectName="user", property="email", label="Email", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textField(objectName="user", property="phoneNumber", label="Telephone", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textArea(objectName="user", property="userAddress", label="Address", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", rows="2", labelPlacement="before")#
														
														#textField(objectName="user", property="userCity", label="City", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#select(objectName="user", property="userState", options=states, label="State", includeBlank="-- Please Select One --", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textField(objectName="user", property="userZip", label="Zip", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textField(objectName="user", property="username", label="Username", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#passwordField(objectName="user", property="userPassword", label="Password", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#select(objectName="user", property="roleID", options=roles, label="Role", includeBlank="-- Please Select One --", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
													</div>

	                              				
	                                  				<div class="modal-footer">
					                                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
					                                    #buttonTag(content="Save Changes", type="submit", class="btn btn-primary")#
	                                  				</div>
                                  				
                                  					#endFormTag()#

                                  				</cfoutput>
                                			</div>
        								</div>
            						</div>





            						<div id="updateModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            							<div class="modal-dialog">
            					  			<div class="modal-content">
                                  				<div class="modal-header">
                                    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    				<h4 class="modal-title">Update User</h4>
                                  				</div>

                                    			<cfoutput>
													#startFormTag(action="update", class="form-horizontal")#

	                                  				<div class="modal-body">
														<div>#hiddenField(objectName="user", property="id")#</div>
														<input type="hidden" value="" name="hiddenUserID">

														#textField(objectName="user", property="name", label="Name", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textField(objectName="user", property="email", label="Email", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textField(objectName="user", property="phoneNumber", label="Telephone", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textArea(objectName="user", property="userAddress", label="Address", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", rows="2", labelPlacement="before")#
														
														#textField(objectName="user", property="userCity", label="City", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#

														#select(objectName="user", property="userState", options=states, label="State", includeBlank="-- Please Select One --", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#textField(objectName="user", property="userZip", label="Zip", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
														
														#passwordField(objectName="user", property="userPassword", label="Password", class="form-control", prependtolabel="<div class='col-lg-9'>", append="</div>", labelPlacement="before")#
													</div>

	                              				
	                                  				<div class="modal-footer">
					                                    <!---<div class="pull-left">
					                                    	<cfif session.userRole EQ "1">
				            									#butonTo(text="Delete This User", confirm="Are you sure?", key="")#
				            								</cfif>
					                                    </div>--->

					                                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
					                                    #buttonTag(content="Save Changes", type="submit", class="btn btn-primary")#
	                                  				</div>
                                  				
                                  					#endFormTag()#

                                  				</cfoutput>
                                			</div>
        								</div>
            						</div>



				            	</div>

				            	<div class="widget-foot">
				            		<!--- footer here --->
				            		
				            		<cfif session.userRole EQ "1">
				            			<a href="#createModal" class="btn btn-success" data-toggle="modal">Create User</a>	
				            		<cfelse>
				            			&nbsp;
				            		</cfif>
				            		
				            		<!---<span class="pull-right">Pagination here</span>--->
				            	</div>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>

<cfinclude template="_footer.cfm">