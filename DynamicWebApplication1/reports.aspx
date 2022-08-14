<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="DynamicWebApplication1.reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <br />

    <div class="container">
        <div class="row">

            <div classes="col-md-10 mx-auto">
                <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                             <img src="imgs/reports-banner.jpg" class="img-fluid"/>
                              <ul></ul>
                        </div>
                        
                         <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Reports</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <hr />
                        </div>

                                            


                        <div class="row">
                            <%--Data Tables Library to be added for search functionality--%>
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>

                        </div>

                        <div class="row">
                            <hr />
                        </div>


                        <%--One full row--%>
                         <div class="row">
                            <div class="col-md-6">
                               <div class="d-grid gap-2 col-6 mx-auto">
                                    <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Print" OnClick="Button1_Click" />
                             
                                </div>
                            </div>                   
                     
                            <div class="col-md-6">
                             
                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <asp:Button class="btn btn-primary" ID="Button3" runat="server" Text="Send" OnClick="Button3_Click" />
                             
                                </div>
                            </div>
                        </div>




                      
                       </div>

                        </div>

                </div>
        </div>
          <asp:Button class="btn btn-success m-2 mx-3" ID="Button2" runat="server" Text="Back to Home" OnClick="Button2_Click"/>
    </div>
    

</asp:Content>
