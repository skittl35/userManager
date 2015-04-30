<cfinclude template="_header.cfm">

<div class="content">
	<div class="mainbar" style="margin-left:0px; min-height:300px;">
		<div class="page-head">
			<h2 class="pull-left">Edit User</h2>
        	<div class="clearfix"></div>
        
        	<!-- Breadcrumb -->
        	<div class="bread-crumb">
          		<cfoutput>#linkTo(text="Home", action="index", title="Home")#</cfoutput> 
          
          		<div class="pull-right">
          			<cfoutput>#linkTo(text="Logout", action="logout", title="Logout")#</cfoutput>
          		</div>
          
          		<span class="divider">/</span> 
          		<cfoutput>#linkTo(text="User Listing", action="index", title="User Listing")#</cfoutput>
          		
          		<span class="divider">/</span>
          		<a href="#" class="bread-current">Edit User</a>
        	</div>
        	<div class="clearfix"></div>
	    </div>

	    <div class="matter">
	    	<div class="container">
	    		<div class="row">
	    			<div class="col-md-12">
	    				<div class="widget">
	    					<div class="widget-head">
	    						<div class="pull-left">Edit User <cfoutput>#user.name#</cfoutput></div>
	    						<div class="widget-icons pull-right">
		    						<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
				                    <a href="#" class="wsettings"><i class="fa fa-wrench"></i></a>  
				                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
				                </div>
				                <div class="clearfix"></div>
				            </div>
				            
				            <div class="widget-content">
 
				            	<div class="padd">
				            	
				            		<cfoutput>

										#startFormTag(action="update", class="form-horizontal")#

											<div>#hiddenField(objectName="user", property="id")#</div>

											#textField(objectName="user", property="name", label="Name", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
											<br />

											#textField(objectName="user", property="email", label="Email", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
											<br />

											#textField(objectName="user", property="phoneNumber", label="Telephone", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
											<br />

											#textArea(objectName="user", property="userAddress", label="Address", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", rows="2", labelPlacement="before")#
											<br />

											#textField(objectName="user", property="userCity", label="City", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
											<br />

											#select(objectName="user", property="userState", options=states, label="State", includeBlank="-- Please Select One --", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
											<br />

											#textField(objectName="user", property="userZip", label="Zip", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
											
											<br />
											#passwordField(objectName="user", property="userPassword", label="Password", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
											<br />

											<div class="buttons">
		                                    #buttonTag(content="Save Changes", type="submit", class="btn btn-primary")#
                          					</div>
                      				
                      					#endFormTag()#

                      				</cfoutput>
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