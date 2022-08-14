<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manageitem.aspx.cs" Inherits="DynamicWebApplication1.manageitem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
     <script type="text/javascript">

      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });

      

   </script>

    <script type="text/javascript">

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
            <div class="col-md-4">

               <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>

                                    <img id="imgview" height="100px" width="100px" src="iteminventory/menu-item-placeholder.png" />
                                </center>
                            </div>
                        </div>





                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Item Info</h3>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Label class="badge rounded-pill bg-success" ID="Label1" runat="server" Text="Available"/>
                                </center>
                            </div> 
                        </div>
                       

                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>




                        <!--file upload-->
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="Label2" runat="server" Text="*"></asp:Label>
                                <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>

                        <br />


                        <%--One full row--%>
                         <div class="row">
                            <div class="col-md-2">
                               <label>ID</label>
                               <div class="form-group">         
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                       placeholder="ID" TextMode="Number" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
                               </div>
                            </div>                
                             
                           
                            <div class="col-md-6">
                               <asp:Label ID="Label4" runat="server" Text="*"></asp:Label><label>Name</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                       placeholder="Name" ReadOnly="true" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                               </div>
                            </div>   
                     
                            <div class="col-md-4">
                            <asp:Label ID="Label3" runat="server" Text="*"></asp:Label><label>Category</label>
                               <div class="form-group">
                                   
                                      <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" Visible="false">                                 
                                      <asp:ListItem Text="Please select Category" Value=""></asp:ListItem>
                                      
                                      <asp:ListItem Text="Confectionery" Value="Confectionery"></asp:ListItem>
                                      <asp:ListItem Text="Cake" Value="Cake"></asp:ListItem>
                                      <asp:ListItem Text="Pastry" Value="Pastry"></asp:ListItem>
                                      <asp:ListItem Text="Frozen" Value="Frozen"></asp:ListItem>
                                      <asp:ListItem Text="Savory" Value="Savory"></asp:ListItem>
                                      <asp:ListItem Text="Drink" Value="Drink"></asp:ListItem>
                                          </asp:DropDownList>
                                   
                                   <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                       placeholder="Category" ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>
                        </div>



                        <br />

                        <%--One full row--%>
                        <div class="row">
                        
                            <div class="col-md-7">
                               <asp:Label ID="Label5" runat="server" Text="*"></asp:Label><label>Description</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                       placeholder="Description" TextMode="MultiLine" ReadOnly="true" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                               </div>
                            </div>
                            
                            <div class="col-md-2">
                               <asp:Label ID="Label6" runat="server" Text="*"></asp:Label><label>Cost</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" TextMode="Number"
                                       ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>                            
                         
                              <div class="col-md-2">
                               <asp:Label ID="Label7" runat="server" Text="*"></asp:Label><label>Quantity</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" TextMode="Number"
                                       ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>                            
                       
                       
                           <br />
                            <br />

                    <%--One full row--%>
                            <br /><br /><br />
                    <div class="row">
                         <div class="col-md-5">
                            <asp:Label ID="Label8" runat="server" Text="*"></asp:Label><label>Availability</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" 
                                    placeholder="Availability" ReadOnly="true"></asp:TextBox>
                                <asp:DropDownList class="form-control"  ID="DropDownList2" runat="server" Visible="false">
                                      <asp:ListItem Text="Please select Availability" Value=""></asp:ListItem>
                                      <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                                      <asp:ListItem Text="Unavailable" Value="Unavailable"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                         </div>
                            
                         <div class="col-md-5">
                            <asp:Label ID="Label9" runat="server" Text="*"></asp:Label><label>Archived</label>
                             
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                    placeholder="Archived Status" ReadOnly="true"></asp:TextBox>
                                 <asp:DropDownList class="form-control"  ID="DropDownList3" runat="server" Visible="false">
                                      <asp:ListItem Text="Please select Archive Status" Value=""></asp:ListItem>
                                      <asp:ListItem Text="Archived" Value="true"></asp:ListItem>
                                      <asp:ListItem Text="Not Archived" Value="false"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                         </div>                            
                   

                               
                         <div class="col-md-2">
                             <div class="form-group">  
                             <label>*Threshold</label>
                               
                                   <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" TextMode="Number"
                                       ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>                            
                         </div>
                 </div>


                        <br />

                        <!--Here-->
                        <asp:Label ID="Label10" runat="server" Text="Please populate all fields marked *" Visible="false"></asp:Label>

                     <div class="row">
                            <div class="col">
                              <hr />
                            </div>
                     </div>


                        <br />
                     <div class="row">
                            <div class="col-md-12">
                               <center>
                                   <asp:Button class="btn btn-dark" ID="Button2" runat="server" Text="Select" OnClick="Button2_Click"></asp:Button>
                                   <asp:Button class="btn btn-dark" ID="Button3" runat="server" Text="Edit" OnClick="Button3_Click" ></asp:Button>                                  
                                   <asp:Button class="btn btn-dark" ID="Button18" runat="server" Text="Cancel" OnClick="Button18_Click" ></asp:Button>
                               </center>
                            </div>
                        </div>
                        <ul></ul>
            
                         <div class="row">
                            <div class="col-md-12">
                               <center>
                                   <asp:Button class="btn btn-success" ID="Button19" runat="server" Text="Add" OnClick="Button19_Click" Visible="false"></asp:Button>
                                   <asp:Button class="btn btn-info" ID="Button4" runat="server" Text="Update" OnClick="Button4_Click" Visible="false" ></asp:Button>
                                   <asp:Button class="btn btn-secondary" ID="Button5" runat="server" Text="Archive" OnClick="Button5_Click" Visible="false"></asp:Button>
                               </center>
                            </div>
                        </div>



                  
                    <br />

                    <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Back to Home" OnClick="Button1_Click" />
                             
                    </div>
                                 
                        </div>
                </div>
            </div>  


            <!--Item List-->
            
            <div class="col-md-8">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/book-online.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <ul></ul>
                                    <h3>Item List</h3>
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
                             <div class="input-group">
                             <div class="col-md-6">
                                 <!--Button CLicks for Sorting-->
                                 <asp:Button class="btn btn-primary" ID="Button6" runat="server" Text="All" OnClick="Button6_Click"/>
                                 <asp:Button class="btn btn-primary" ID="Button7" runat="server" Text="Confectionery" OnClick="Button7_Click" />
                                 <asp:Button class="btn btn-primary" ID="Button8" runat="server" Text="Cake" OnClick="Button8_Click" />
                                 <asp:Button class="btn btn-primary" ID="Button9" runat="server" Text="Pastry" OnClick="Button9_Click"/>
                                 <asp:Button class="btn btn-primary" ID="Button10" runat="server" Text="Frozen" OnClick="Button10_Click"/>
                                 <asp:Button class="btn btn-primary" ID="Button11" runat="server" Text="Savory" OnClick="Button11_Click"  />
                                 <asp:Button class="btn btn-primary" ID="Button12" runat="server" Text="Drink" OnClick="Button12_Click" />
                             </div>
                           
                             
                             <div class="d-grid gap-2 d-md-flex justify-content-end">

                                 <asp:Button class="btn btn-dark" ID="Button13" runat="server" Text="View Items Below Threshold" OnClick="Button13_Click"/>
                                 <asp:Button class="btn btn-success" ID="Button14" runat="server" Text="View Availabile" OnClick="Button14_Click"
                                     Visible="false" />
                                 <asp:Button class="btn btn-warning" ID="Button15" runat="server" Text="View Unavailable" OnClick="Button15_Click"/>
                                 <asp:Button class="btn btn-secondary" ID="Button16" runat="server" Text="View Archived" OnClick="Button16_Click"/>
                                 <asp:Button class="btn btn-light" ID="Button17" runat="server" Text="View Unarchived" 
                                     Visible="false" OnClick="Button17_Click" />
                                 </div>
                             </div>
                         </div>
                         </div>

                        <ul></ul>
                        
                        <div class="row">

                            <!--Personal Database Connection
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>    
                                -->
                            <!--Group Database Connection-->
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [S_Item]">
                             
                            </asp:SqlDataSource>

                            <div class="col">
                                <%--Data Tables Library to be added for search functionality--%>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CellPadding="4" DataKeyNames="Item_ID" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Item_ID" HeaderText="Item ID" SortExpression="Item_ID" InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="Item_Category" HeaderText="Category" SortExpression="Item_Category" />
                                        <asp:BoundField DataField="Item_Name" HeaderText="Name" SortExpression="Item_Name" />
                                        <asp:BoundField DataField="Item_Description" HeaderText="Description" SortExpression="Item_Description" />
                                        <asp:BoundField DataField="Item_Price" HeaderText="Price" SortExpression="Item_Price" />
                                        <asp:BoundField DataField="Item_Quantity" HeaderText="Quantity" SortExpression="Item_Quantity" />
                                        <asp:BoundField DataField="Item_Threshold" HeaderText="Threshold" SortExpression="Item_Threshold" />
                                        <asp:BoundField DataField="Item_AvailabilityStatus" HeaderText="Availability" SortExpression="Item_AvailabilityStatus" />
                                        <asp:BoundField DataField="Item_Archived" HeaderText="Archived" SortExpression="Item_Archived" />
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
