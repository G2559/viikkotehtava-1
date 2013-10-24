using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class G2559_RegularExpression : System.Web.UI.Page
{
    String valid = "Valid";
    String invalid = "Invalid";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.RequestType == "POST")
        {
            string name = Request.Form["txtNimi"];
            if (name.Length > 0)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(name,
                                                   "^[a-zA-Z'.]{1,40}$"))
                    lblValidoi1.Text = valid;
                    
                else
                lblValidoi1.Text = invalid;
            }
            string sposti = Request.Form["txtSposti"];
            if (sposti.Length > 0)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(sposti,
                                                   "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$"))
                    lblValidoi2.Text = valid;

                else
                    lblValidoi2.Text = invalid;
            }
        }
    }
}