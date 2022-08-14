<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="employeeprofile.aspx.cs" Inherits="DynamicWebApplication1.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <script type="text/javascript">

         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });

         function readURL(input) {
             if (input.files && input.files[0]) {
                 var reader = new FileReader();

                 reader.onload = function (e) {
                     $('#imgview').attr('src', e.target.result);
                 };

                 reader.readAsDataURL(input.files[0]);
             }
         }

   </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

     <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">

               <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Employee Profile</h3>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Label ID="Label2" runat="server" Text="Credit Standing:"></asp:Label>
                                    <asp:Label class="badge rounded-pill bg-success" ID="Label1" runat="server" Text="Good"/>
                                </center>                            
                            </div>
                        </div>
                       

                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>

                        <%--One full row--%>
                         <div class="row">
                            <div class="col-md-6">
                               <label>Name</label>
                               <div class="form-group">         
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                       placeholder="Employee Name" ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>                   
                     
                            <div class="col-md-6">
                            <label>Surname</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                       placeholder="Surname" ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>
                        </div>


                        <%--One full row--%>
                        <div class="row">
                            <div class="col-md-6">
                               <label>Email</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                       placeholder="Email" ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>
                            
                            <div class="col-md-6">
                               <label>Phone</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                       placeholder="Phone" ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>                            
                    </div>


                    <%--One full row--%>
                    <div class="row">
                         <div class="col-md-6">
                            <label>Credits Limit</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                    placeholder="Credit Limit" ReadOnly="true"></asp:TextBox>
                            </div>
                         </div>
                            
                         <div class="col-md-6">
                            <label>Credit Balance</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" 
                                    placeholder="Credit Balance" ReadOnly="true"></asp:TextBox>
                            </div>
                         </div>                            
                    </div>



                     <%--One full row--%>
                    <div class="row">
                         <div class="col-md-6">
                            <label>Employee ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                    placeholder="Employee ID" ReadOnly="true"></asp:TextBox>
                            </div>
                         </div>
                            
                        
   

         
                         <div class="col-md-6">
                            <label>Password</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                    placeholder="************" ReadOnly="True" TextMode="Password"></asp:TextBox>
                                    
                                    <asp:ImageButton ID="ImageButton1" ImageUrl="imgs/seepassword.png" width="30" Height="30"  runat="server" OnClick="ImageButton1_Click"/>
                                    <asp:ImageButton ID="ImageButton2" ImageUrl="imgs/hidepassword.png" width="30" Height="30"  runat="server" OnClick="ImageButton2_Click" Visible="false"/>
                                            
                                </div>
                                
                            </div>
                         </div>                            
                    </div>



                     <div class="row">
                            <div class="col">
                              <hr />
                            </div>
                     </div>

                        <!--Here-->
                        <asp:Label ID="Label5" runat="server" Text="Required *" Visible="false"></asp:Label>

                     <div class="row">
                            <div class="col">
                                <center>
                                   <asp:Button class="btn btn-dark" ID="Button2" runat="server" Text="Reset Password" OnClick="Button2_Click"></asp:Button>
                                </center>
                            </div>
                        </div>

                        <!--To hold password-->
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [S_Employee] WHERE ([Emp_Email] = @Emp_Email)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBox3" Name="Emp_Email" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
               
                    
                        <ul></ul>
                        <%--One full row--%>
                        <div class="row">
                            <div class="col-md-6">
                               <asp:Label ID="Label3" runat="server" Text="*Enter New Password" Visible="false"></asp:Label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" 
                                    placeholder="New Password" TextMode="Password" Visible="False"></asp:TextBox>
                                     <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" 
                                     TextMode="SingleLine" Visible="False"></asp:TextBox>

                                    <asp:ImageButton ID="ImageButton3" ImageUrl="imgs/seepassword.png" width="30" Height="30"  runat="server" OnClick="ImageButton3_Click" Visible="false"/>
                                    <asp:ImageButton ID="ImageButton4" ImageUrl="imgs/hidepassword.png" width="30" Height="30"  runat="server" OnClick="ImageButton4_Click" Visible="false"/>

                                </div>
                                
                               </div>
                            </div>                            
      
                    
                  
                         <div class="col-md-6">
                            <asp:Label ID="Label4" runat="server" Text="*Confirm New Password" Visible="false"></asp:Label>
                            <div class="form-group">
                                <div class="input-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" 
                                     placeholder="Confirm New Password" TextMode="Password" Visible="False"></asp:TextBox>
                                    <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" 
                                     TextMode="SingleLine" Visible="False"></asp:TextBox>

                                    <asp:ImageButton ID="ImageButton5" ImageUrl="imgs/seepassword.png" width="30" Height="30"  runat="server" OnClick="ImageButton5_Click" Visible="false"/>
                                    <asp:ImageButton ID="ImageButton6" ImageUrl="imgs/hidepassword.png" width="30" Height="30"  runat="server" OnClick="ImageButton6_Click" Visible="false"/>

                                </div>
                           
                            </div>
                         </div>
                     </div> 


                        <br />



                    <%--One full row--%>
                    <div class="row">
                         <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-dark" ID="Button3" runat="server" Text="Change Password" Visible="false" OnClick="Button3_Click" />
                            </div>                                                
       
                        <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-dark" ID="Button4" runat="server" Text="Cancel" Visible="false" OnClick="Button4_Click" />
                         </div>
                     </div>
                    

                  
                    <br />

                    <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Back to Home" OnClick="Button1_Click" />
                             
                    </div>
                                 
                        </div>
                </div>
            </div>  


            <!--Order History-->
            
            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/publisher.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <ul></ul>
                                    <h3>Order History</h3>
                                    <ul></ul>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>
                        
                        
                     <div class="row">

                         <div class="col">
                             <div class="col-md-11 mx-auto">
                                 <!--Button CLicks for Sorting-->
                                 <asp:Button class="btn btn-primary" ID="Button11" runat="server" Text="View All Orders" OnClick="Button11_Click"/>
                                 <asp:Button class="btn btn-primary" ID="Button5" runat="server" Text="View Collected Orders" OnClick="Button5_Click" />
                                 <asp:Button class="btn btn-primary" ID="Button6" runat="server" Text="View Ready Orders" OnClick="Button6_Click" />
                                 <asp:Button class="btn btn-primary" ID="Button7" runat="server" Text="View In-Progress Orders" OnClick="Button7_Click"/>
                                 <asp:Button class="btn btn-primary" ID="Button8" runat="server" Text="View Unfullfilled Orders" OnClick="Button8_Click" Visible="false"/>
                            <ul></ul>
                              </div>
                         </div>
                         </div>


                        
                        <div class="row">

                            <!--Personal Database Connection
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>    
                                -->
                            <!--Group Database Connection-->
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [S_Order]">
                             
                            </asp:SqlDataSource>

                            <div class="col">
                                <%--Data Tables Library to be added for search functionality--%>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CellPadding="4" DataKeyNames="Order_No" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Order_No" HeaderText="Order" SortExpression="Order_No" InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="Worker_ID" HeaderText="Barista ID" SortExpression="Worker_ID" />
                                        <asp:BoundField DataField="Order_Total" HeaderText="Total" SortExpression="Order_Total" />
                                        <asp:BoundField DataField="Order_Date" HeaderText="Date" SortExpression="Order_Date" DataFormatString="{0:MM/dd/yyy}" />
                                        <asp:BoundField DataField="Order_Time" HeaderText="Time" SortExpression="Order_Time" />
                                        <asp:BoundField DataField="Order_Status" HeaderText="Status" SortExpression="Order_Status" />
                                        <asp:BoundField DataField="Order_TimeFetched" HeaderText="Collected At" SortExpression="Order_TimeFetched" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>
                        </div>
                        
      
                                 
                   </div>
                </div>

            </div>

        </div>
    </div>

</asp:Content>
