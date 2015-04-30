<cfinclude template="_header.cfm">
	
	<div class="admin-form">
		<div class="container">
    		<div class="row">
    			<div class="col-md-12">
            		<div class="widget">
            			<div class="widget-head">
                			<i class="icon-lock"></i> Login 
            			</div>

            			<div class="widget-content">
                			<div class="padd">
                				
                				<!--- Errors, if applicable --->
                				<cfif isdefined("params.emailValid") AND params.emailValid EQ "No">
            						<h6 style="color:red; font-weight:bold;">Invalid Email</h6>
            					<cfelseif isdefined("params.passwordValid") AND params.passwordValid EQ "No">
            						<h6 style="color:red; font-weight:bold;">Invalid Password</h6>
            					</cfif>
                				
                				<form class="form-horizontal" action='loginAction'>
		                    		
                					<!--- Email --->
		                    		<div class="form-group">
	                    				<cfoutput>
	                    					#textFieldTag(name="email", label="Email", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
	                    				</cfoutput>
		                			</div>
		                    
		                    		<!--- Password --->
		                    		<div class="form-group">
                    					<cfoutput>
                    						#passwordFieldTag(name="password", label="Password", class="form-control", prependtolabel="<div class='col-lg-12'>", append="</div>", labelPlacement="before")#
                    					</cfoutput>
		                			</div>

		                    		<!--- Form Buttons --->
		                        	<div class="col-lg-9 col-lg-offset-3">
										<button type="submit" class="btn btn-success">Sign in</button>
										<button type="reset" class="btn btn-default">Reset</button>
									</div>
                    				<br />
		                  		</form>
							</div>
		                </div>
		            </div>  
		    	</div>
		    </div>
		</div> 
	</div>

<cfinclude template="_footer.cfm">