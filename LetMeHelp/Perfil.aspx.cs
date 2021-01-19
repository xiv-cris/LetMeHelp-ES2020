using LetMeHelp.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LetMeHelp
{
    public partial class Perfil : Page
    {
        private string PassDefault;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uID"] == null)
                Response.Redirect("~/");

            divErrors.Visible = false;
            divUpdate.Visible = false;

            if (Request.QueryString["updated"] != null)
            {
                divUpdate.Visible = true;
                UpdateText.Text = "O seu perfil foi atualizado com sucesso!";
            }
                

            using (var db = new ModelLMH())
            {
                var _user = db.Utilizadores.ToList().Find(i => i.UserId == int.Parse(Session["uID"].ToString()));

                imgUser.ImageUrl = _user.UserPicLink;

                NomeDefault.Text = _user.UserFullName;
                TelDefault.Text = _user.UserPhone.ToString();
                DescriptionDefault.Text = _user.UserBio;
                PassDefault = _user.UserPass;
            }
        }

        protected void ButtonRegistar_Click(object sender, EventArgs e)
        {

            if (TextBoxPass.Text != TextBoxPass2.Text)
            {
                divErrors.Visible = true;
                StatusText.Text = "As palavras-passe não são iguais!";
                TextBoxPass.Focus();
            }
            else
            {
                ValidateInputs();
                UpdateUser();

                Response.Redirect("Perfil.aspx?updated=1");
            }
        }

        private void ValidateInputs()
        {
            if (string.IsNullOrEmpty(TextBoxNome.Text))
                TextBoxNome.Text = NomeDefault.Text;
            
            if (string.IsNullOrEmpty(TextBoxTel.Text))
                TextBoxTel.Text = TelDefault.Text;
            
            if (string.IsNullOrEmpty(TextAreaDescription.Text))
                TextAreaDescription.Text = DescriptionDefault.Text;

            if (string.IsNullOrEmpty(TextBoxPass2.Text))
                TextBoxPass2.Text = PassDefault;

        }

        private void UpdateUser()
        {
            using (var db = new ModelLMH())
            {
                var _user = db.Utilizadores.ToList().Find(i => i.UserId == int.Parse(Session["uID"].ToString()));

                _user.UserFullName = TextBoxNome.Text.Trim();
                _user.UserPhone = int.Parse(TextBoxTel.Text.Trim());
                _user.UserBio = TextAreaDescription.Text.Trim();
                _user.UserPass = TextBoxPass2.Text.Trim();
                _user.UserPicLink = UploadFile(_user.UserPicLink.ToString());

                db.SaveChanges();
                Session["uFullName"] = _user.UserFullName;
            }
        }

        protected string UploadFile(string aImgDefault)
        {
            string folderPath = Server.MapPath("~/imgs/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }

            if (!Path.GetFileName(ImgUpload.FileName).Contains("."))
                return aImgDefault;

            //Save the File to the Directory (Folder).
            ImgUpload.SaveAs(folderPath + Path.GetFileName(ImgUpload.FileName));

            //Display the Picture in Image control.
            return "~/imgs/" + Path.GetFileName(ImgUpload.FileName);
        }
    }
}