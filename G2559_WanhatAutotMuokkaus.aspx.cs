using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class G2559_WanhatAutotMuokkaus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGrid();
            ClearScreen();
        }
    }

    private void BindGrid()
    {
        AutotDAL objAutoDAL = new AutotDAL();
        grdViewAuto.DataSource = objAutoDAL.GetAll();
        grdViewAuto.DataBind();
    }

    protected void grdViewAuto_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[1].Attributes.Add("onclick", "return confirm('Are you sure want to delete?')");
        }
    }

    protected void grdViewAuto_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdViewAuto.PageIndex = e.NewPageIndex;
        grdViewAuto.SelectedIndex = -1;
        BindGrid();
    }

    protected void grdViewAuto_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        hndId.Value = grdViewAuto.Rows[e.NewSelectedIndex].Cells[2].Text.Trim();
        if (hndId.Value.Length > 0)
        {
            AutotDAL objAutoDAL = new AutotDAL();
            BLAutot auto = objAutoDAL.Get(hndId.Value);

            txtaid.Text = Convert.ToString(auto.aid);
            txtrekkari.Text = auto.rekkari;
            txtmerkki.Text = auto.merkki;
            txtmalli.Text = auto.malli;
            txtvm.Text = Convert.ToString(auto.vm);
            txtmyyntiHinta.Text = Convert.ToString(auto.myyntiHinta);
            txtsisaanOstoHinta.Text = Convert.ToString(auto.sisaanOstoHinta);
            lblMessage.Text = "";
        }
    }

    protected void grdViewAuto_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string strId = grdViewAuto.Rows[e.RowIndex].Cells[2].Text.Trim();
            if (strId.Length > 0)
            {
                AutotDAL objAutoDAL = new AutotDAL();
                objAutoDAL.Delete(strId);

                ClearScreen();
                BindGrid();
                lblMessage.Text = "Record deleted successfully";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "There is an error occured while processing the request. Please verify the code!";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsValid) return;

            BLAutot auto = new BLAutot();
            auto.rekkari = txtrekkari.Text;
            auto.merkki = txtmerkki.Text;
            auto.malli = txtmalli.Text;
            auto.vm = Convert.ToInt32(txtvm.Text);
            auto.myyntiHinta = Convert.ToInt64(txtmyyntiHinta.Text);
            auto.sisaanOstoHinta = Convert.ToInt64(txtsisaanOstoHinta.Text);
            auto.aid = Convert.ToInt64(hndId.Value);

            AutotDAL objAutoDAL = new AutotDAL();
            if ((hndId.Value.Trim().Length > 0) &&
                (Convert.ToInt64(hndId.Value) > 0))
                objAutoDAL.Update(auto);
            else
                objAutoDAL.Create(auto);

            ClearScreen();
            BindGrid();
            lblMessage.Text = "Record saved successfully";
        }
        catch (Exception ex)
        {
            lblMessage.Text = "There is an error occured while processing the request. Please verify the code!";
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearScreen();
    }

    private void ClearScreen()
    {
        txtaid.Text = "Auto Generated";
        txtrekkari.Text = "";
        txtmerkki.Text = "";
        txtmalli.Text = "";
        txtvm.Text = "";
        txtmyyntiHinta.Text = "";
        txtsisaanOstoHinta.Text = "";
        hndId.Value = "0";
    }

    //Validointi
     protected void cusCustom_ServerValidate(object source, ServerValidateEventArgs args)
    {


            if (BLAutot.isValidRekkari(args.Value)) 
                args.IsValid = true;
            else
                args.IsValid = false;
        
    }

    protected void cvMyyntihinta_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (BLAutot.isValidHinta(args.Value))
            args.IsValid = true;
        else
            args.IsValid = false;
    }

    protected void cvVuosimalli_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (BLAutot.isValidVuosi(args.Value))
            args.IsValid = true;
        else
            args.IsValid = false;
    }


}