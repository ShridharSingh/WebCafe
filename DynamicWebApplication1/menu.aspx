
<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="DynamicWebApplication1.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">

      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });

   </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
    <div class="row">

        <div class="col-md-10 mx-auto">
            <div class="card">
                <div class="card-body">
                        
                    <div class="row">
                       <img src="imgs/menu-banner4.jpg" class="img-fluid"/>
                       <ul></ul>
                    </div>
                        
                    <div class="row">
                        <hr />
                    </div>

                       
                    <!--Session Variables enable credits options to be shown, set as visible=false at first page load-->
                    <div class="row">
                        <div class="col-md-3 mx-auto">
                           <asp:Label ID="Label2" runat="server" Text="Credits Used" Visible="false"></asp:Label>
                           <div class="form-group">         
                               <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                   placeholder="Employee Credits" ReadOnly="True" Visible="false"></asp:TextBox>
                           </div>
                        </div> 

                       
                        <div class="col-md-3 mx-auto">
                           <asp:Label ID="Label3" runat="server" Text="Credits Remaining" Visible="false"></asp:Label>
                           <div class="form-group">         
                               <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                   placeholder="Employee Credits" ReadOnly="True" Visible="false"></asp:TextBox>
                            <br />
                           </div>
                       </div>     
                    </div>
                            
                    <div class="row">
                        <hr />
                    </div>


                      

                    <div class="row">

                       <div class="col">
                           <div class="col-11">
                               <!--Button CLicks for Sorting-->
                               <asp:Button class="btn btn-primary" ID="Button11" runat="server" Text="All" OnClick="Button11_Click" />
                               <asp:Button class="btn btn-primary" ID="Button5" runat="server" Text="Confectionery" OnClick="Button5_Click" />
                               <asp:Button class="btn btn-primary" ID="Button6" runat="server" Text="Cake" OnClick="Button6_Click" />
                               <asp:Button class="btn btn-primary" ID="Button7" runat="server" Text="Pastry" OnClick="Button7_Click" />
                               <asp:Button class="btn btn-primary" ID="Button8" runat="server" Text="Frozen" OnClick="Button8_Click" />
                               <asp:Button class="btn btn-primary" ID="Button9" runat="server" Text="Savory" OnClick="Button9_Click" />
                               <asp:Button class="btn btn-primary" ID="Button10" runat="server" Text="Drink" OnClick="Button10_Click" />
                            </div>
                         </div>

                       <div class="col col-3 mx-10">
                           <!--DropDownList-->
                           <div class="form-group">
                               <div class="input-group">
                               <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">                                 
                               <asp:ListItem Text="Confectionery" Value="Confectionery"></asp:ListItem>
                               <asp:ListItem Text="Cake" Value="Cake"></asp:ListItem>
                               <asp:ListItem Text="Pastry" Value="Pastry"></asp:ListItem>
                               <asp:ListItem Text="Frozen" Value="Frozen"></asp:ListItem>
                               <asp:ListItem Text="Savory" Value="Savory"></asp:ListItem>
                               <asp:ListItem Text="Drink" Value="Drink"></asp:ListItem>

                               </asp:DropDownList>
                             
                               <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                               </div>
                           </div>                        
                        </div>
                      </div>


               <!--SQL Data Source Connections->

                       <!-- Personal Database Connection
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
                           --> 
                        
                   
                        <!--Group Database Connection-->
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [S_Item] WHERE (([Item_AvailabilityStatus] = @Item_AvailabilityStatus) AND ([Item_Category] = @Item_Category))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Available" Name="Item_AvailabilityStatus" Type="String" />
                                <asp:ControlParameter ControlID="DropDownList1" Name="Item_Category" PropertyName="SelectedValue" Type="String" />
                                
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [Worker_ID] FROM [S_CanteenWorker]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [CART]"></asp:SqlDataSource>
                        </div>

                        <!--DataTables-->


                        <!--TableMain-->
                        
                            <div class="row">
                                <ul></ul>
                            <%--Data Tables Library to be added for search functionality--%>
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Item_ID" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Item_ID" HeaderText="Item ID" SortExpression="Item_ID" InsertVisible="False" ReadOnly="True" />
   
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                           <div class="container-fluid">
                                               <div class="row">
                                                   <div class="col-lg-8">

                                                       <div class="row">
                                                           <div class="col-12">
                                                               <asp:Label ID="Label1" runat="server" Text='<%# Eval("Item_Name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                           </div>
                                                       </div>

                                                        <div class="row">
                                                           <div class="col-12">

                                                               <strong>Item Cost -&nbsp;
                                                               <asp:Label ID="Label8" runat="server" Text='<%# Eval("Item_Price") %>'></asp:Label>
                                                               &nbsp;Credits</strong></div>
                                                       </div>

                                                        <div class="row">
                                                           <div class="col-12">

                                                               Description -
                                                               <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="Medium" style="font-style: italic; font-weight: 700" Text='<%# Eval("Item_Description") %>'></asp:Label>

                                                           </div>
                                                       </div>

                                                        <div class="row">
                                                           <div class="col-12">

                                                               Category -
                                                               <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Item_Category") %>'></asp:Label>
                                                               &nbsp;| Quantity Remaining -
                                                               <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Item_Quantity") %>'></asp:Label>

                                                           </div>
                                                       </div>

                                                   </div>

                                                   <div class="col-lg-1">
                       
                                                      
                                                   </div>

                                                    <div class="col-lg-2">
                                                         <asp:Image CssClass="img-fluid p-2" ID="Image1" runat="server" Height="150px" Width="150px" ImageUrl='<%# Eval("Item_Image_Link") %>' />
                                                   </div>
                                                   <div class="col-md-1">
          
                                                        <asp:Button ID ="AddButton" Text="Add" runat="server" class="btn btn-dark" CommandArgument='<%# Eval("Item_ID") %>' OnClick="AddButton_Click"/>
                                                   </div>

                            
                                               </div>
                                           </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
   
                               
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




                        <div >                
                            <hr />
                        </div>

                        <div class="row">
                            <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go to Cart" OnClick="Button1_Click" />



                             
                    </div>

                    </div>

                </div>
            </div>       
      </div>

        <asp:Button class="btn btn-success m-2 mx-3" ID="Button2" runat="server" Text="Back to Home" OnClick="Button2_Click"/>
</div>
  

</asp:Content>