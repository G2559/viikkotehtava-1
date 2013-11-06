using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ilmo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void btnHae_Click(object sender, EventArgs e)
    {
        srcIlmot.SelectCommand = "SELECT asioid, lastname, firstname, date FROM lasnaolot WHERE lastname like '"+ txtSukunimi.Text +"%' AND course like '"+ DropDownIlmot.SelectedValue +"%'";
    }
}