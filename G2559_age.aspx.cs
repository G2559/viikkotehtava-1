using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class G2559_age : System.Web.UI.Page
{

    private void Page_Load(object sender, System.EventArgs e)
    {
        if (!IsPostBack)
        {
            Calendar1.SelectedDate = System.DateTime.Now;
            lblTänään.Text = "Tänään on " + System.DateTime.Now.ToShortDateString();
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //valittu päivä
        lblValittu.Text = "valittu päivä: " + Calendar1.SelectedDate.ToShortDateString()
             + " valittu vuosi: " + Calendar1.SelectedDate.Year.ToString();
        TimeSpan ts;
        ts = System.DateTime.Now - Calendar1.SelectedDate;
        lblTulos.Text = string.Format(" päivien erotus on {0} päivää", ts.Days);
    }
    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        Calendar1.SelectedDate = Calendar1.SelectedDate.Date.AddYears(-1);
        Calendar1.VisibleDate = Calendar1.SelectedDate;
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        Calendar1.SelectedDate = Calendar1.SelectedDate.Date.AddYears(1);
        Calendar1.VisibleDate = Calendar1.SelectedDate;
    }
}