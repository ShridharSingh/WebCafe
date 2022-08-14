<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="DynamicWebApplication1.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <section>
        <center>   
            <h1 class="display-1">WELCOME TO DIMENSION DATA CAFE!</h1>      
            <img src="imgs/canteen-banner-4.jpg" class="img-fluid" width="1720" />
        </center>
    </section>

<ul></ul>

    <section>
         <div class="container">
             <div class="row">
                 <div class="col-12">
                     <center>
                     
                         <h3>Today's Deals</h3>
                       
                          <div class="row">
                            <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button class="btn btn-warning" ID="Button6" runat="server" Text="View Menu" OnClick="Button1_Click" />                                
                        <br />                             
                    </div>                       
                         <hr />
                     </center>
                 </div>
             </div>
         </div>

         
         <div class="row">
             <div class="col-md-4">                 
                 <center>
                 <img width="200px" src="imgs/savoury1.jpeg" />
                 <h4><asp:Button class="btn btn-light" ID="Button1" runat="server" Text="1. Samoosa - 5 Credits" OnClick="Button1_Click"></asp:Button></h4>
                 </center>
             </div>


             <br />
             <div class="col-md-4">
                 <center>
                  
                     <br /><br />
                 <img width="300px" src="imgs/milkshakes.jpeg" />
                 <h4><asp:Button class="btn btn-light" ID="Button2" runat="server" Text="2. Milkshakes - 10 Credits" OnClick="Button2_Click"></asp:Button></h4>
                 </center>
             </div>

             <div class="col-md-4">
                 <center>
                 <img width="400px" src="imgs/1brittle.jpg" />
                 <h4><asp:Button class="btn btn-light" ID="Button3" runat="server" Text="3. Brittle - 5 Credits" OnClick="Button3_Click"></asp:Button></h4>
                 </center>
             </div>

         </div>

         <br />

          <div class="row">
             <div class="col-md-3 mx-auto">                 
                 <center>
                
                 <img width="400px" src="imgs/32turnover.png" />
                 <h4><asp:Button class="btn btn-light" ID="Button4" runat="server" Text="4. Turnover - 8 Credits" OnClick="Button4_Click"></asp:Button></h4>
                 </center>
             </div>
             <br />
             <div class="col-md-3 mx-auto">
                 <center>
                 <img width="350px" src="imgs/26jellytots.jpg" />
                 <h4><asp:Button class="btn btn-light" ID="Button5" runat="server" Text="5. Jelly Tots - 8 Credits" OnClick="Button5_Click"></asp:Button></h4>
                 </center>
             </div>
                        
         </div>

   
    </section>

    <br />
    <section>
        <center>
            <img src="imgs/menu-banner2.jpg" class="img-fluid"/>
        </center>
    </section>

    <br />
     <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    
                    <h5>At Dimension Data Cafe, we see to it that the Employees at Dimension Data always have something to appease their hunger.
                        Whether on the go, in-between meetings, or even hosting a client for lunch, our infrastructure  caters for it all!</h5>
                    </center>
                </div>
            </div>
        </div>
    </section>

  

</asp:Content>
