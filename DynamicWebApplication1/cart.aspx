<%@ Page Title="" EnableEventValidation="false"  Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="DynamicWebApplication1.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">

            <div class="col-md-10 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/shopping-cart2.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <ul></ul>
                                    <h3>Shopping Cart</h3>
                                    <ul></ul>
                                </center>
                            </div>
                        </div>
          
                        <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="Label" Visible="false"></asp:Label>

                        <div class="row">
                            <div class="col-md-3 mx-auto">
                                <div class="form-group">         
                                   
                               </div>
                            </div> 
                       
                            <div class="col-md-3">
                                <asp:Label ID="label1" runat="server" Text="Total Credits:" Visible="false"></asp:Label>
                                <div class="d-grid gap-2 col-3">         
                                   <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                       ReadOnly="True" Visible="false"></asp:TextBox>
                               </div>        
                            </div>
                        </div>


                          <div class="row">
                            <div class="col-md-3 mx-auto">
                                <div class="form-group">         
                         
                               </div>
                            </div> 

                       
                            <div class="col-md-3 m">
                                <label>Insert Quantity:</label>
                                <div class="d-grid gap-2 col-3">         
                                   
                                       <div class="form-group">
                                
                                 <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">                                 
                                 <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                 <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                 <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                 <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                 <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                 <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                 <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                 <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                 <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                 <asp:ListItem Text="10" Value="10"></asp:ListItem>
                             </asp:DropDownList>
                             
                                  
                              
                               </div>
                            </div>

                        </div>


                        <br /><br />

                    <div class="row">
                       <div class="d-grid gap-2 col-3 mx-auto">
                        <asp:Button class="btn btn-primary" ID="Button3" runat="server" Text="Proceed to Checkout" OnClick="Button1_Click" />
                        <asp:Button class="btn btn-warning" ID="Button5" runat="server" Text="Proceed using Overdraft" Visible="false" OnClick="Button6_Click"  />
                    </div>
                    
                    
                    <div class="d-grid gap-2 col-3 mx-auto">
                        <asp:Button class="btn btn-success" ID="Button4" runat="server" Text="Clear Cart" OnClick="Button2_Click" />
                             
                    </div>

                </div>


                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>

                        
                        
                    <div class ="row">
                       


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [CART]">
                            </asp:SqlDataSource>

                       
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Cart_ID" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource1">
                                <AlternatingRowStyle BackColor="White" />
                                
                                <Columns>
   
                                    <asp:BoundField DataField="Item_ID" HeaderText="Item ID" SortExpression="Item_ID" />
   
                                    <asp:BoundField DataField="Item_Name" HeaderText="Name" ItemStyle-Width="25%" SortExpression="Item_Name" >
<ItemStyle Width="25%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Item_Category" HeaderText="Category" ItemStyle-Width="25%" SortExpression="Item_Category" >
<ItemStyle Width="25%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Selected_Item_Quantity" HeaderText="Selected Quantity" ItemStyle-Width="10%" SortExpression="Selected_Item_Quantity" >
<ItemStyle Width="10%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Item_Quantity" HeaderText="Amount Available" ItemStyle-Width="10%" SortExpression="Item_Quantity" >
<ItemStyle Width="10%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Item_Price" HeaderText="Cost" ItemStyle-Width="10%" SortExpression="Item_Price" >
                                    
                                   
<ItemStyle Width="10%"></ItemStyle>
                                    </asp:BoundField>
                                    
                                   
                                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" />
                                    
                                   
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                       
                                              <div class="col-md-1">
                                               
                                                    <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("Item_Image_Link") %>' />
                                            
                                              </div>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                        
                          
                                    <asp:TemplateField>     
                                        <ItemTemplate>
                                            <div class="col-md-1">
                                               
                                               
                                                <asp:Button ID ="AddButton" Text="Change Quantity" runat="server" class="btn btn-dark" CommandArgument='<%# Eval("Cart_ID") %>' OnClick="AddButton_Click"/>
                                                <asp:Button ID="Button7" Text="Remove" runat="server" CssClass="btn btn-light" CommandArgument='<%# Eval("Cart_ID") %>' OnClick="RemoveButton_Click"/>


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
                    </div>





                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>

                            





                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>







                        <div class="form-control">
                            <div class="row">
                            <div class="col-md-3 mx-auto">
                               <label>Order Total</label>
                               <div class="form-group">         
                                   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                       ReadOnly="True"></asp:TextBox>
                               </div>
                            </div> 

                       
                            <div class="col-md-3 mx-auto">
                               <asp:Label ID="Label2" runat="server" Text="Credits Remaining After Purchase" Visible="false"></asp:Label>
                               <div class="form-group">         
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                       ReadOnly="True" Visible="false"></asp:TextBox>
                               </div>
                            </div>            


                    
                    </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <%--Data Tables Library to be added for search functionality--%>

                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>

                <div class="row">
                       <div class="d-grid gap-2 col-3 mx-auto">
                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Proceed to Checkout" OnClick="Button1_Click" />
                        <asp:Button class="btn btn-warning" ID="Button6" runat="server" Text="Proceed using Overdraft" Visible="false" OnClick="Button6_Click"  />
                             
                    </div>
                    
                    
                    <div class="d-grid gap-2 col-3 mx-auto">
                        <asp:Button class="btn btn-success" ID="Button2" runat="server" Text="Clear Cart" OnClick="Button2_Click" />
                             
                    </div>

                </div>
                 
                                 
                   </div>
                </div>

            </div>

                <br />
         
</div>

    </div>

            
</asp:Content>
